//*************************************************************************
// Заполняем массив для сравнения
//*************************************************************************
int initCfg(void)
{
 int n=0,kol_oper=0;
 char *str;
 struct patt *prom,*new_el;
 FILE *ptr;

 if((ptr=fopen("polis.cfg","r+"))==NULL)
 {
  clrscr();
  printf("\n\n\n\n\n\n                  Нет файла конфигурации polis.cfg !!!\n\n                 Создайте файл, введите исходные данные");
  sleep(4);
  return 0;
 }

 if(!(head= new (struct patt)))
 {
  clrscr();
  printf("\n\n\n\n\n\n                     Нет памяти!!!");
  sleep(4);
  return 0;
 }
 head->next=NULL;

 fscanf(ptr,"%d",&kol_oper); //считываю окличество операций

 do
 {
  if(!(new_el=new (struct patt)))
  {
   clrscr();
   printf("\n\n\n\n\n\n                     Нет памяти!!!");
   sleep(4);
   return 0;
  }

  if((head->next)==NULL)
  {
   fscanf(ptr,"%d",&new_el->ves);
   fscanf(ptr,"%s",str);
   new_el->oper=fn_oper(str);

   head->next=new_el;
   new_el->next=NULL;
   prom=new_el;
   n++;
  }
  else
  {
   fscanf(ptr,"%d",&new_el->ves);
   fscanf(ptr,"%s",str);
   new_el->oper=fn_oper(str);

   prom->next=new_el;
   new_el->next=NULL;
   prom=new_el;
   n++;
  }
 }while(n<kol_oper);
 return 1;
}
//****************************************************************************
// Функция выделения памяти под строку
//****************************************************************************
char* fn_oper (char *str)
{
 char* str1,i;
 int n;

 n=strlen(str);
 str1=new char[n+1];
 for(i=0;i<(n+1);i++)
 {
  *(str1+i)=*(str+i);
 }
 return str1;
}












