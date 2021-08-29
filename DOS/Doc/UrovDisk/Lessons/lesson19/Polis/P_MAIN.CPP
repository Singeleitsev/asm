// Преобразование арифметического выражения в обратную
// польскую инверсную запись

#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <dos.h>
#include <alloc.h>
#include <stdlib.h>
struct patt {                  //единая структура для стека и списка весов
	     char        *oper;
	     int          ves ;
	     struct patt *next;
	    } ;

struct patt *steck_head,*head;

struct patt* fn_izmen(void);      //изменение прома
int   izmen_znak(int);            //Проверка на унарнўй минус
void  podmena(int);               //Меняем минус на ИЗ
void   proverka(void);            //Проверка скобок
void   in_steck(struct patt*);    //Запись операции в стек
void   initialStr(void);          //Загрузка выражения
void   what_do_oper(struct patt*);//Реакция на операцию
void   print_num(char*);          //Печать оператора
void   print_oper(char*);         //печать операции
char*  CutCh(int pos_nach,int pos_end);//Из строки вырезаем подстроку
char*  fn_oper(char*);            //Функция  выделения динамической памяти
void   analiz(void);              //Выделяем операция это или операнд
int    initCfg(void);             //Сгружаем с файла веса операций
int    my_exit(void);             //выход из программы
struct patt* what_is_this (char*);//Проверка не является ли набор символов
				  //операцией
int per_znak=1;
char SourseStr[256],*BackStr,*FastStr;

void main ()
{
 steck_head=new(struct patt);
 steck_head->next=NULL;

 if(!initCfg()) return; //загрузка из файла весов не прошла
 initialStr();
 proverka();
 analiz();
 my_exit();
}

//*************************************************************************
// Анализируем последовательности
//*************************************************************************

void analiz (void)
{
 struct patt *prom;
 int num_pos=0,prizn=0,dlina=0,str_len=1,str_len2=1;
 char* Ch;

 while(1)
 {
  dlina=strlen(SourseStr);
  BackStr=fn_oper(CutCh(num_pos,num_pos+str_len));//* формирую заднюю строку
						   //*

  if((num_pos+str_len)>=dlina)  //Не закончилась ли строка
  {
   if((prom=what_is_this(BackStr))!=NULL) //если задняя строка-операция
   {
    what_do_oper(prom);
   }
   else
   {
    print_num(BackStr);
   }

   while(1)
   {
    if ((steck_head->next)==NULL)    //Печатаем остаток стека если
    {                                //входная строка закончилась
     return;
    }
    print_oper(steck_head->next->oper);
    steck_head->next=steck_head->next->next;
   }
  }

  if((prom=what_is_this(BackStr))!=NULL) //если задняя строка-операция
  {
   what_do_oper(prom);

   num_pos=num_pos+str_len;//устанавливаем параметры поиска заново
   str_len=0;              //после того как задняя строка оказалась опрецией
   str_len2=1;
  }

  else           //задняя строка не операция
  {
   while ((num_pos+str_len+str_len2)<=dlina)   //формировать переднюю строку
   {
    FastStr=fn_oper(CutCh(num_pos+str_len,num_pos+str_len+str_len2));//* формирем переднюю строку

    if((prom=what_is_this(FastStr))!=NULL)//если передняя строка-операция
    {
     print_num(BackStr); //печатаем операнд

     what_do_oper(prom); //проверяем что делать с операцией
     
     num_pos=num_pos+str_len+str_len2; //сдивнули позицию на длину операнда и
     str_len=0;                        //операции; установили новые параметры
     str_len2=1;                       //
     prizn=1;			       //
    }
    else
    {
     str_len2++;  //увеличиваем на символ заднюю строку
    }
    if(prizn==1) break;
   }
  }
  str_len++;//после всех проверок сдвигаем на единицу
  str_len2=1;
 }
}
//**************************************************************************
// Что делать с операцией
//**************************************************************************

void what_do_oper (struct patt *prom)
{
 struct patt *prom1,*steck_prom;

 switch(prom->ves)
 {
  case 0:{  //обрабатываем открывающие скобки (пишем в стек)
	  in_steck(prom);
	  per_znak=1;
	  break;
	 }
  case 1:{ //закрывающиеся скобки(выпихиваем все до открывающей включая ее)
	  while(1)
	  {
	   if((steck_head->next->ves)!=0)  //если не открывающая скобка
	   {
	    print_oper(steck_head->next->oper);         //вытолкнули на экран
	    if((steck_head->next->next)==NULL)   //* стек закончился а открывающей
	    {                              //* скобки не нашли
	     steck_head->next=NULL;
	     per_znak=0;
	     break;
	    }
	    else
	    {
	     steck_head->next=steck_head->next->next; //движемся по стеку
	    }
	   }
	   else
	   {
	    if((steck_head->next->next)==NULL)   //* стек закончился  открывающей скобкой
	    {                              //* скобки не нашли
	     steck_head->next=NULL;
	     per_znak=0;
	     return;
	    }
	    else
	    {
	     steck_head->next=steck_head->next->next;//движемся по стеку
	     per_znak=0;
	     break;
	    }
	   }
	  }
	  per_znak=0;
	  break;
	 }
  default:{ //обработка обычной операции без спецприоритетов
	    if( !(strcmp(prom->oper,"-"))&&(per_znak==1))//производми настройку
	    {                                      //prom_а на ИЗ
	     prom=fn_izmen();
	    }

	    if(steck_head->next==NULL)//если стек еще пустой
	    {
	     in_steck(prom);
	     per_znak=1;
	     return;
	    }
	    if((prom->ves)>(steck_head->next->ves))//если приоритет пришедшей
	    {                                      //операции больше пишем ее
	     in_steck(prom);                       //в стек
	     per_znak=1;
	     return;
	    }
	    else
	    {
	     while(1)
	     {
	      print_oper(steck_head->next->oper);             //вытолкнули на экран
	      if((steck_head->next->next)==NULL)   //* стек закончился
	      {                                    //* обнулили стек
	       steck_head->next=NULL;
	       in_steck(prom);
	       per_znak=1;
	       return;
	      }
	      else
	      {
	       steck_head->next=steck_head->next->next; //движемся по стеку
	      }
	      if((prom->ves)>(steck_head->next->ves))  //проверка продолжать
	      {                                         //ли выталкивать
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

