//*************************************************************************
// Инициализация строки
//*************************************************************************

void initialStr(void)
{
 clrscr();
 printf("\nВведите алгебраическое выражение (не более 256 символов)\n\n?: ");
 scanf("%s",SourseStr);
 printf("\n\n : ");
}

//*************************************************************************
// Вырезаем символ
//*************************************************************************

char* CutCh (int pos_nach,int pos_end)
{
 int i;
 char str[256];

 for(i=0;i<(pos_end-pos_nach);i++)
 {
  *(str+i)=*(SourseStr+(pos_nach+i));//копия начальной строки
 }
 *(str+i)='\x0';

 return str;
}
//************************************************************************
// Проверка на операцию
//************************************************************************

struct patt* what_is_this (char* Str)
{
 struct patt *prom;
 prom=head->next;

 do         //проверяем на операцию
 {
  if(!strcmp(prom->oper,Str))
  {
   return prom;
  }
  prom=prom->next;

 } while(prom->next!=NULL);

 if(!strcmp(prom->oper,Str)) //для последнего prom_a
 {
  return prom;
 }

 return NULL;
}
//***************************************************************************
// Печать операнда
//***************************************************************************

void print_num (char *Str)
{
 printf("%s ",Str);
 per_znak=0;
}
//***************************************************************************
// Печать операции
//***************************************************************************

void print_oper (char *Str)
{
 printf("%s ",Str);
 per_znak=1;
}
//**************************************************************************
//Запись в стек
//**************************************************************************

void in_steck(struct patt *prom)
{
 char *str;
 struct patt *prom1;

 if((steck_head->next)==NULL)    //если стек пустой
 {
  prom1=new(struct patt);
  prom1->next=NULL;
  prom1->ves=prom->ves;
  str=fn_oper(prom->oper);// Записываю в стек операцию
  prom1->oper=str;        //
  steck_head->next=prom1;
 }
 else
 {
  prom1=new(struct patt);
  prom1->next=steck_head->next;
  prom1->ves=prom->ves;
  str=fn_oper(prom->oper);// Записываю в стек операцию
  prom1->oper=str;        //
  steck_head->next=prom1;
 }
}
//**********************************************************************
//Функция проверки скобок
//**********************************************************************

void proverka (void)
{
 int dlina,i,kol_otkr=0,kol_zakr=0;

 dlina=strlen(SourseStr);

 for(i=0;i<dlina;i++)
 {
  if((*(SourseStr+i))=='('||(*(SourseStr+i))=='['||(*(SourseStr+i))=='{')
  {
   kol_otkr++;
  }
  if((*(SourseStr+i))==')'||(*(SourseStr+i))=='}'||(*(SourseStr+i))==']')
  {
   kol_zakr++;
  }
 }

 if(kol_otkr!=kol_zakr)
 {
  printf("\n\n   Не хватает скобки!!!");
  printf("\n   Повторите ввод");
  my_exit();
 }
}
//************************************************************************
// функция изменения прома
//************************************************************************
struct patt* fn_izmen (void)
{
 char *str;
 struct patt *prom;
 prom=head->next;

 str=new char[3];
 *(str+0)='И';
 *(str+1)='З';
 *(str+2)='\x0';

 while((prom->next)!=NULL)
 {
  if(!strcmp((prom->oper),str))
  {
   return prom;
  }
  else
  {
   prom=prom->next;
  }
 }

 if(!strcmp((prom->oper),str))
 {
  return prom;
 }
}
//***********************************************************************
// Выход из программы
//***********************************************************************

int my_exit (void)
{
 getche();
 textcolor(7);
 exit(1);
}



