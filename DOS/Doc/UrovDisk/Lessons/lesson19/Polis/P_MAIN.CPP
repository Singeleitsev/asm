// �८�ࠧ������ ��䬥��᪮�� ��ࠦ���� � ������
// ������� �������� ������

#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <dos.h>
#include <alloc.h>
#include <stdlib.h>
struct patt {                  //������ ������� ��� �⥪� � ᯨ᪠ ��ᮢ
	     char        *oper;
	     int          ves ;
	     struct patt *next;
	    } ;

struct patt *steck_head,*head;

struct patt* fn_izmen(void);      //��������� �஬�
int   izmen_znak(int);            //�஢�ઠ �� 㭠��� �����
void  podmena(int);               //���塞 ����� �� ��
void   proverka(void);            //�஢�ઠ ᪮���
void   in_steck(struct patt*);    //������ ����樨 � �⥪
void   initialStr(void);          //����㧪� ��ࠦ����
void   what_do_oper(struct patt*);//������ �� ������
void   print_num(char*);          //����� ������
void   print_oper(char*);         //����� ����樨
char*  CutCh(int pos_nach,int pos_end);//�� ��ப� ��१��� �����ப�
char*  fn_oper(char*);            //�㭪��  �뤥����� �������᪮� �����
void   analiz(void);              //�뤥�塞 ������ �� ��� ���࠭�
int    initCfg(void);             //���㦠�� � 䠩�� ��� ����権
int    my_exit(void);             //��室 �� �ணࠬ��
struct patt* what_is_this (char*);//�஢�ઠ �� ���� �� ����� ᨬ�����
				  //����樥�
int per_znak=1;
char SourseStr[256],*BackStr,*FastStr;

void main ()
{
 steck_head=new(struct patt);
 steck_head->next=NULL;

 if(!initCfg()) return; //����㧪� �� 䠩�� ��ᮢ �� ��諠
 initialStr();
 proverka();
 analiz();
 my_exit();
}

//*************************************************************************
// ��������㥬 ��᫥����⥫쭮��
//*************************************************************************

void analiz (void)
{
 struct patt *prom;
 int num_pos=0,prizn=0,dlina=0,str_len=1,str_len2=1;
 char* Ch;

 while(1)
 {
  dlina=strlen(SourseStr);
  BackStr=fn_oper(CutCh(num_pos,num_pos+str_len));//* �ନ��� ������ ��ப�
						   //*

  if((num_pos+str_len)>=dlina)  //�� �����稫��� �� ��ப�
  {
   if((prom=what_is_this(BackStr))!=NULL) //�᫨ ������ ��ப�-������
   {
    what_do_oper(prom);
   }
   else
   {
    print_num(BackStr);
   }

   while(1)
   {
    if ((steck_head->next)==NULL)    //���⠥� ���⮪ �⥪� �᫨
    {                                //�室��� ��ப� �����稫���
     return;
    }
    print_oper(steck_head->next->oper);
    steck_head->next=steck_head->next->next;
   }
  }

  if((prom=what_is_this(BackStr))!=NULL) //�᫨ ������ ��ப�-������
  {
   what_do_oper(prom);

   num_pos=num_pos+str_len;//��⠭�������� ��ࠬ���� ���᪠ ������
   str_len=0;              //��᫥ ⮣� ��� ������ ��ப� ��������� ���樥�
   str_len2=1;
  }

  else           //������ ��ப� �� ������
  {
   while ((num_pos+str_len+str_len2)<=dlina)   //�ନ஢��� ��।��� ��ப�
   {
    FastStr=fn_oper(CutCh(num_pos+str_len,num_pos+str_len+str_len2));//* �ନ६ ��।��� ��ப�

    if((prom=what_is_this(FastStr))!=NULL)//�᫨ ��।��� ��ப�-������
    {
     print_num(BackStr); //���⠥� ���࠭�

     what_do_oper(prom); //�஢��塞 �� ������ � ����樥�
     
     num_pos=num_pos+str_len+str_len2; //ᤨ��㫨 ������ �� ����� ���࠭�� �
     str_len=0;                        //����樨; ��⠭����� ���� ��ࠬ����
     str_len2=1;                       //
     prizn=1;			       //
    }
    else
    {
     str_len2++;  //㢥��稢��� �� ᨬ��� ������ ��ப�
    }
    if(prizn==1) break;
   }
  }
  str_len++;//��᫥ ��� �஢�ப ᤢ����� �� �������
  str_len2=1;
 }
}
//**************************************************************************
// �� ������ � ����樥�
//**************************************************************************

void what_do_oper (struct patt *prom)
{
 struct patt *prom1,*steck_prom;

 switch(prom->ves)
 {
  case 0:{  //��ࠡ��뢠�� ���뢠�騥 ᪮��� (��襬 � �⥪)
	  in_steck(prom);
	  per_znak=1;
	  break;
	 }
  case 1:{ //����뢠�騥�� ᪮���(�믨娢��� �� �� ���뢠�饩 ������ ��)
	  while(1)
	  {
	   if((steck_head->next->ves)!=0)  //�᫨ �� ���뢠��� ᪮���
	   {
	    print_oper(steck_head->next->oper);         //��⮫��㫨 �� ��࠭
	    if((steck_head->next->next)==NULL)   //* �⥪ �����稫�� � ���뢠�饩
	    {                              //* ᪮��� �� ��諨
	     steck_head->next=NULL;
	     per_znak=0;
	     break;
	    }
	    else
	    {
	     steck_head->next=steck_head->next->next; //�������� �� �⥪�
	    }
	   }
	   else
	   {
	    if((steck_head->next->next)==NULL)   //* �⥪ �����稫��  ���뢠�饩 ᪮����
	    {                              //* ᪮��� �� ��諨
	     steck_head->next=NULL;
	     per_znak=0;
	     return;
	    }
	    else
	    {
	     steck_head->next=steck_head->next->next;//�������� �� �⥪�
	     per_znak=0;
	     break;
	    }
	   }
	  }
	  per_znak=0;
	  break;
	 }
  default:{ //��ࠡ�⪠ ���筮� ����樨 ��� ᯥ�ਮ��⮢
	    if( !(strcmp(prom->oper,"-"))&&(per_znak==1))//�ந������ ����ன��
	    {                                      //prom_� �� ��
	     prom=fn_izmen();
	    }

	    if(steck_head->next==NULL)//�᫨ �⥪ �� ���⮩
	    {
	     in_steck(prom);
	     per_znak=1;
	     return;
	    }
	    if((prom->ves)>(steck_head->next->ves))//�᫨ �ਮ��� ��襤襩
	    {                                      //����樨 ����� ��襬 ��
	     in_steck(prom);                       //� �⥪
	     per_znak=1;
	     return;
	    }
	    else
	    {
	     while(1)
	     {
	      print_oper(steck_head->next->oper);             //��⮫��㫨 �� ��࠭
	      if((steck_head->next->next)==NULL)   //* �⥪ �����稫��
	      {                                    //* ���㫨�� �⥪
	       steck_head->next=NULL;
	       in_steck(prom);
	       per_znak=1;
	       return;
	      }
	      else
	      {
	       steck_head->next=steck_head->next->next; //�������� �� �⥪�
	      }
	      if((prom->ves)>(steck_head->next->ves))  //�஢�ઠ �த������
	      {                                         //�� ��⠫������
	       per_znak=1;
	       return;
	      }
	     }
	    }
	  }
 }
}

////////////////////////////////////////////////////////////////////////////
//************************************************************************//
#include "fn_polis.cpp"
#include "massiv.cpp"

