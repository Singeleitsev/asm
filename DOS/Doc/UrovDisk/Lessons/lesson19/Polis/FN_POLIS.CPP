//*************************************************************************
// ���樠������ ��ப�
//*************************************************************************

void initialStr(void)
{
 clrscr();
 printf("\n������ �����ࠨ�᪮� ��ࠦ���� (�� ����� 256 ᨬ�����)\n\n?: ");
 scanf("%s",SourseStr);
 printf("\n\n : ");
}

//*************************************************************************
// ��१��� ᨬ���
//*************************************************************************

char* CutCh (int pos_nach,int pos_end)
{
 int i;
 char str[256];

 for(i=0;i<(pos_end-pos_nach);i++)
 {
  *(str+i)=*(SourseStr+(pos_nach+i));//����� ��砫쭮� ��ப�
 }
 *(str+i)='\x0';

 return str;
}
//************************************************************************
// �஢�ઠ �� ������
//************************************************************************

struct patt* what_is_this (char* Str)
{
 struct patt *prom;
 prom=head->next;

 do         //�஢��塞 �� ������
 {
  if(!strcmp(prom->oper,Str))
  {
   return prom;
  }
  prom=prom->next;

 } while(prom->next!=NULL);

 if(!strcmp(prom->oper,Str)) //��� ��᫥����� prom_a
 {
  return prom;
 }

 return NULL;
}
//***************************************************************************
// ����� ���࠭��
//***************************************************************************

void print_num (char *Str)
{
 printf("%s ",Str);
 per_znak=0;
}
//***************************************************************************
// ����� ����樨
//***************************************************************************

void print_oper (char *Str)
{
 printf("%s ",Str);
 per_znak=1;
}
//**************************************************************************
//������ � �⥪
//**************************************************************************

void in_steck(struct patt *prom)
{
 char *str;
 struct patt *prom1;

 if((steck_head->next)==NULL)    //�᫨ �⥪ ���⮩
 {
  prom1=new(struct patt);
  prom1->next=NULL;
  prom1->ves=prom->ves;
  str=fn_oper(prom->oper);// �����뢠� � �⥪ ������
  prom1->oper=str;        //
  steck_head->next=prom1;
 }
 else
 {
  prom1=new(struct patt);
  prom1->next=steck_head->next;
  prom1->ves=prom->ves;
  str=fn_oper(prom->oper);// �����뢠� � �⥪ ������
  prom1->oper=str;        //
  steck_head->next=prom1;
 }
}
//**********************************************************************
//�㭪�� �஢�ન ᪮���
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
  printf("\n\n   �� 墠⠥� ᪮���!!!");
  printf("\n   ������ ����");
  my_exit();
 }
}
//************************************************************************
// �㭪�� ��������� �஬�
//************************************************************************
struct patt* fn_izmen (void)
{
 char *str;
 struct patt *prom;
 prom=head->next;

 str=new char[3];
 *(str+0)='�';
 *(str+1)='�';
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
// ��室 �� �ணࠬ��
//***********************************************************************

int my_exit (void)
{
 getche();
 textcolor(7);
 exit(1);
}



