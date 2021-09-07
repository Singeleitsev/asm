#include <iostream>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <unistd.h>

#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#include <GLUT/glut.h>

#define CUBE_SIZE_A 0.5f
#define CUBE_SIZE_B 0.2f

#define WIN_WIDTH  1000
#define WIN_HEIGHT 1000

#define TRANSFORMATION_SPEED 0.004
#define ROTATION_SPEED       0.0017

static double t_transformation = 0.0;
static double t_rotation       = 0.0;

static bool animation = true;


/*=== Utils
==============================================================================================*/
/**
 * Simple transition
 *
 * @param {double} from
 * @param {double} to
 * @param {double} k - [0, 1]
 *
 * @return {double}
 */
#define transit_s(from, to, k) \
  ((from) + ((to) - (from)) * (k))

/**
 * Transition with extra `x` value
 *
 * @param {double} from
 * @param {double} to
 * @param {double} k
 * @param {double} x
 *
 * @return {double}
 */
#define transit_x(from, to, k, x) \
  ((from) + (x) + ((to) - (x) - (from)) * (k))

/**
 * Trigonometric value to scale
 *
 * @param {double} h - [-1, +1]
 *
 * @return {double} - [0, 1]
 */
#define trigonometric_scale(h) \
  (((h) + 1.0) / 2.0)


/*=== Calculations
==============================================================================================*/
/*  Easings
-----------------------------------------------*/
/**
 * Quadratic in-out easing
 *
 * @param {double} t - [0, 1]
 *
 * @return {double}
 *
 * @note
 * y = 1/2 (2x)^2                  ; [0, 0.5)
 * y = -1/2 ((2x - 1)(2x - 3) - 1) ; [0.5, 1]
 */
static double ease_quad_in_out(double t)
{
  if (t < 0.5) {
    return 2 * t * t;
  } else {
    return -2 * t * t + 4 * t - 1;
  }
}

/**
 * Circular in-out easing
 *
 * @param {double} t - [0, 1]
 *
 * @return {double}
 *
 * @note
 * y = 1/2 (1 - sqrt(1 - 4x^2))          ; [0, 0.5)
 * y = 1/2 (sqrt(-(2x - 3)(2x - 1)) + 1) ; [0.5, 1]
 */
static double ease_circular_in_out(double t)
{
  if (t < 0.5) {
    return 0.5 * (1 - sqrt(1 - 4 * t * t));
  } else {
    return 0.5 * (sqrt(-(2 * t - 3) * (2 * t - 1)) + 1);
  }
}


/*  Cube params
-----------------------------------------------*/
/**
 * Set parameters of `k1`, `k2`, `x` for specified time of `t`
 *
 * @param {double} t - time
 * @param {double *} k1 - a transition coefficient
 * @param {double *} k2 - a transition coefficient esp. used with `transit_x`
 * @param {double *} x - a inner cube's move around x-axis
 */
static void set_parameters(double t, double *k1, double *k2, double *x)
{
  static float d = -(CUBE_SIZE_A - CUBE_SIZE_B) / 2.0;

  t = ease_quad_in_out(t);

  *k1 = trigonometric_scale(sin(M_PI * t - M_PI / 2.0));

  if (t < 0.25) {
    *x = d * t * 4.0;
    *k2 = 0.0;
  } else {
    *x = d;
    *k2 = trigonometric_scale(sin((M_PI + 1.0) * (t - 0.25) - M_PI / 2.0));
  }
}


/*=== Renderer
==============================================================================================*/
/**
 * Tesseract renderer
 */
static void render_tesseract()
{
  /*
    SPACE
    =====

          5-----------1          y
        / |         / |          |
      /   |       /   |          |
    4-----------0     |          |
    |     |     |     |          |
    |     7-----|-----3          0----------- x
    |   /       |   /          /
    | /         | /          /
    6-----------2          z

  */

  int i, j;

  static double a = CUBE_SIZE_A;
  static double b = CUBE_SIZE_B;

  double k1, k2, x;
  set_parameters(t_transformation, &k1, &k2, &x);

  float vertices[16][3] = {
    /* [ 0] A0 -> B0 */ { transit_s(+a, +b, k1),    transit_s(+a, +b, k1), transit_s(+a, +b, k1) },
    /* [ 1] A1 -> B1 */ { transit_s(+a, +b, k1),    transit_s(+a, +b, k1), transit_s(-a, -b, k1) },
    /* [ 2] A2 -> B2 */ { transit_s(+a, +b, k1),    transit_s(-a, -b, k1), transit_s(+a, +b, k1) },
    /* [ 3] A3 -> B3 */ { transit_s(+a, +b, k1),    transit_s(-a, -b, k1), transit_s(-a, -b, k1) },

    /* [ 4] A4 -> A0 */ { transit_s(-a, +a, k1),    +a,                    +a },
    /* [ 5] A5 -> A1 */ { transit_s(-a, +a, k1),    +a,                    -a },
    /* [ 6] A6 -> A2 */ { transit_s(-a, +a, k1),    -a,                    +a },
    /* [ 7] A7 -> A3 */ { transit_s(-a, +a, k1),    -a,                    -a },

    /* [ 8] B0 -> B4 */ { transit_x(+b, -b, k2, x), +b,                    +b },
    /* [ 9] B1 -> B5 */ { transit_x(+b, -b, k2, x), +b,                    -b },
    /* [10] B2 -> B6 */ { transit_x(+b, -b, k2, x), -b,                    +b },
    /* [11] B3 -> B7 */ { transit_x(+b, -b, k2, x), -b,                    -b },

    /* [12] B4 -> A4 */ { transit_x(-b, -a, k2, x), transit_s(+b, +a, k2), transit_s(+b, +a, k2) },
    /* [13] B5 -> A5 */ { transit_x(-b, -a, k2, x), transit_s(+b, +a, k2), transit_s(-b, -a, k2) },
    /* [14] B6 -> A6 */ { transit_x(-b, -a, k2, x), transit_s(-b, -a, k2), transit_s(+b, +a, k2) },
    /* [15] B7 -> A7 */ { transit_x(-b, -a, k2, x), transit_s(-b, -a, k2), transit_s(-b, -a, k2) },
  };

  static int edges[34][2] = {
    {  0,  1 }, {  0,  2 }, { 0,  4 }, { 0, 8 },
    {  1,  3 }, {  1,  5 }, { 1,  9 },
    {  2,  3 }, {  2,  6 }, { 2, 10 },
    {  3,  7 }, {  3, 11 },
    {  4,  5 }, {  4,  6 }, { 4, 12 },
    {  5,  7 }, {  5, 13 },
    {  6,  7 }, {  6, 14 },
    {  7, 15 },
    {  8,  9 }, {  8, 10 }, { 8, 12 },
    {  9, 11 }, {  9, 13 },
    { 10, 11 }, { 10, 14 },
    { 11, 15 },
    { 12, 13 }, { 12, 14 },
    { 13, 15 },
    { 14, 15 },
  };

  static int faces[24][4] = {
    // Cube A
    { 0, 1, 3, 2 },
    { 4, 5, 7, 6 },
    { 4, 0, 2, 6 },
    { 5, 1, 3, 7 },
    { 5, 1, 0, 4 },
    { 7, 3, 2, 6 },

    // Cube B
    {  8,  9, 11, 10 },
    { 12, 13, 15, 14 },
    { 12,  8, 10, 14 },
    { 13,  9, 11, 15 },
    { 13,  9,  8, 12 },
    { 15, 11, 10, 14 },

    // Flaps
    { 0,  1,  9,  8 },
    { 4,  5, 13, 12 },
    { 4,  0,  8, 12 },
    { 5,  1,  9, 13 },
    { 2,  3, 11, 10 },
    { 6,  7, 15, 14 },
    { 6,  2, 10, 14 },
    { 7,  3, 11, 15 },
    { 0,  8, 10,  2 },
    { 1,  9, 11,  3 },
    { 4, 12, 14,  6 },
    { 5, 13, 15,  7 },
  };


  /// Rotate
  double rot_x = 360.0 * ease_circular_in_out(t_rotation);
  double rot_y = 360.0 * t_rotation;

  glRotatef(rot_x, 1.0, 0.0, 0.0);
  glRotatef(rot_y, 0.0, 1.0, 0.0);


  /// Draw edges
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  glHint(GL_LINE_SMOOTH_HINT, GL_DONT_CARE);
  glColor4f(1.0, 1.0, 1.0, 0.9);
  glLineWidth(2.5);

  for (i = 0; i < 34; ++i) {
    glBegin(GL_LINES);
      for (j = 0; j < 2; ++j) {
        glVertex3fv(vertices[edges[i][j]]);
      }
    glEnd();
  }

  glDisable(GL_BLEND);


  /// Draw faces
  glDisable(GL_DEPTH_TEST);
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  glColor4f(0.1, 0.4, 0.5, 0.2);

  for (i = 0; i < 24; ++i) {
    glBegin(GL_POLYGON);
      for (j = 0; j < 4; ++j) {
        glVertex3fv(vertices[faces[i][j]]);
      }
    glEnd();
  }

  glEnable(GL_DEPTH_TEST);
  glDisable(GL_BLEND);
}


/*=== Animation controllers
==============================================================================================*/
/**
 * Step in/out animation frame
 *
 * @param {int} dir - `+n` for a next frame; `-n` for a previous
 */
static void step_animation(int dir)
{
  t_transformation = fmod(1.0 + t_transformation + dir * TRANSFORMATION_SPEED, 1.0);
  t_rotation       = fmod(1.0 + t_rotation       + dir * ROTATION_SPEED,       1.0);
}

/**
 * Toggle animation
 */
static void toggle_animation()
{
  animation = !animation;
}


/*=== OpenGL
==============================================================================================*/
/**
 * Display
 */
static void display(void)
{
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  if (animation) {
    step_animation(+1);
  }

  glPushMatrix();
    render_tesseract();
  glPopMatrix();

  glFlush();
  glutSwapBuffers();
  glutPostRedisplay();
}

/**
 * Initializer
 */
static void init(char *progname)
{
  float aspect = (float) WIN_WIDTH / WIN_HEIGHT;

  glutInitWindowPosition(0, 0);
  glutInitWindowSize(WIN_WIDTH, WIN_HEIGHT);
  glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH);
  glutCreateWindow(progname);

  glClearColor(0.05, 0.05, 0.07, 1.0);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();

  gluPerspective(45.0, aspect, 0.1, 100.0);

  gluLookAt(
    0.5, 1.5, 2.5,
    0.0, 0.0, 0.0,
    0.0, 1.0, 0.0
  );

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

  glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);

  glEnable(GL_DEPTH_TEST);
  glEnable(GL_LINE_SMOOTH);
}

/**
 * Keyboard
 *
 * @param {unsigned char} key
 * @param {int} x
 * @param {int} y
 */
static void keyboard_service(unsigned char key, int x, int y)
{
  switch (key) {
    case 't':
      toggle_animation();
      break;
    case 'n':
      step_animation(+1);
      break;
    case 'p':
      step_animation(-1);
      break;
    case 'q':
    case 27: // <Esc>
      exit(0);
  }

  glutPostRedisplay();
}


/*=== Entry point
==============================================================================================*/
int main(int argc, char** argv)
{
  glutInit(&argc, argv);
  init(argv[0]);

  glutDisplayFunc(display);
  glutKeyboardFunc(keyboard_service);
  glutMainLoop();

  return 0;
}
