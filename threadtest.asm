
_threadtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}



int main(int argc, char *argv[]) 
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 30             	sub    $0x30,%esp

	struct add a1;
	struct add a2;
	struct add a3;

	a1.id = 1;
  14:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)

	a2.id = 2;
  1b:	c7 45 d4 02 00 00 00 	movl   $0x2,-0x2c(%ebp)

	a3.id = 3;
 
  printf(1, "\nbalance created...");
  22:	68 2e 09 00 00       	push   $0x92e
  27:	6a 01                	push   $0x1

	a1.id = 1;

	a2.id = 2;

	a3.id = 3;
  29:	c7 45 d8 03 00 00 00 	movl   $0x3,-0x28(%ebp)
 
  printf(1, "\nbalance created...");
  30:	e8 ab 05 00 00       	call   5e0 <printf>
  void *s1, *s2, *s3;
  int t1, t2, t3, r1, r2, r3;
  int * retv1, * retv2, * retv3;

  s1 = malloc(PGSIZE*2); //stack to be used by the thread
  35:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
  3c:	e8 cf 07 00 00       	call   810 <malloc>
  41:	89 c7                	mov    %eax,%edi
  s2 = malloc(PGSIZE*2); //stack to be used by the thread
  43:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
  4a:	e8 c1 07 00 00       	call   810 <malloc>
  s3 = malloc(PGSIZE*2); //stack to be used by the thread, we can add this functionality in the kernel also
  4f:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
  void *s1, *s2, *s3;
  int t1, t2, t3, r1, r2, r3;
  int * retv1, * retv2, * retv3;

  s1 = malloc(PGSIZE*2); //stack to be used by the thread
  s2 = malloc(PGSIZE*2); //stack to be used by the thread
  56:	89 c6                	mov    %eax,%esi
  s3 = malloc(PGSIZE*2); //stack to be used by the thread, we can add this functionality in the kernel also
  58:	e8 b3 07 00 00       	call   810 <malloc>
  5d:	89 c3                	mov    %eax,%ebx
  
  if((uint)s1 % PGSIZE) //to make the stack page aligned
  5f:	89 f8                	mov    %edi,%eax
  61:	83 c4 10             	add    $0x10,%esp
  64:	25 ff 0f 00 00       	and    $0xfff,%eax
  69:	74 08                	je     73 <main+0x73>
  	s1 = s1 + (PGSIZE - (uint)s1 % PGSIZE);
  6b:	29 c7                	sub    %eax,%edi
  6d:	81 c7 00 10 00 00    	add    $0x1000,%edi
  
  if((uint)s2 % PGSIZE) //to make the stack page aligned
  73:	89 f0                	mov    %esi,%eax
  75:	25 ff 0f 00 00       	and    $0xfff,%eax
  7a:	74 08                	je     84 <main+0x84>
  	s2 = s2 + (PGSIZE - (uint)s2 % PGSIZE);
  7c:	29 c6                	sub    %eax,%esi
  7e:	81 c6 00 10 00 00    	add    $0x1000,%esi

  if((uint)s3 % PGSIZE) //to make the stack page aligned
  84:	89 d8                	mov    %ebx,%eax
  86:	25 ff 0f 00 00       	and    $0xfff,%eax
  8b:	74 08                	je     95 <main+0x95>
  	s3 = s3 + (PGSIZE - (uint)s3 % PGSIZE);
  8d:	29 c3                	sub    %eax,%ebx
  8f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  
  printf(1, "\nstacks created...");
  95:	83 ec 08             	sub    $0x8,%esp
  98:	68 42 09 00 00       	push   $0x942
  9d:	6a 01                	push   $0x1
  9f:	e8 3c 05 00 00       	call   5e0 <printf>

  t1 = thread_create(test , (void*)&a1, (void *)s1);
  a4:	8d 45 d0             	lea    -0x30(%ebp),%eax
  a7:	83 c4 0c             	add    $0xc,%esp
  aa:	57                   	push   %edi
  ab:	50                   	push   %eax
  ac:	68 90 01 00 00       	push   $0x190
  b1:	e8 7c 04 00 00       	call   532 <thread_create>
  b6:	89 c7                	mov    %eax,%edi
    printf(1, "\nt1 created...");
  b8:	58                   	pop    %eax
  b9:	5a                   	pop    %edx
  ba:	68 55 09 00 00       	push   $0x955
  bf:	6a 01                	push   $0x1
  c1:	e8 1a 05 00 00       	call   5e0 <printf>

  t2 = thread_create(test, (void*)&a2, (void *)s2); 
  c6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  c9:	83 c4 0c             	add    $0xc,%esp
  cc:	56                   	push   %esi
  cd:	50                   	push   %eax
  ce:	68 90 01 00 00       	push   $0x190
  d3:	e8 5a 04 00 00       	call   532 <thread_create>
  printf(1, "\nt2 created...");
  d8:	59                   	pop    %ecx
  printf(1, "\nstacks created...");

  t1 = thread_create(test , (void*)&a1, (void *)s1);
    printf(1, "\nt1 created...");

  t2 = thread_create(test, (void*)&a2, (void *)s2); 
  d9:	89 c6                	mov    %eax,%esi
  printf(1, "\nt2 created...");
  db:	58                   	pop    %eax
  dc:	68 64 09 00 00       	push   $0x964
  e1:	6a 01                	push   $0x1
  e3:	e8 f8 04 00 00       	call   5e0 <printf>

  t3 = thread_create(test, (void*)&a3, (void *)s3); 
  e8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  eb:	83 c4 0c             	add    $0xc,%esp
  ee:	53                   	push   %ebx
  ef:	50                   	push   %eax
  f0:	68 90 01 00 00       	push   $0x190
  f5:	e8 38 04 00 00       	call   532 <thread_create>
  fa:	89 c3                	mov    %eax,%ebx
  printf(1, "\nt3 created...");
  fc:	58                   	pop    %eax
  fd:	5a                   	pop    %edx
  fe:	68 73 09 00 00       	push   $0x973
 103:	6a 01                	push   $0x1
 105:	e8 d6 04 00 00       	call   5e0 <printf>

  r1 = thread_join(t1, (void **) &retv1);
 10a:	59                   	pop    %ecx
 10b:	58                   	pop    %eax
 10c:	8d 45 dc             	lea    -0x24(%ebp),%eax
 10f:	50                   	push   %eax
 110:	57                   	push   %edi
 111:	e8 0c 04 00 00       	call   522 <thread_join>
    printf(1, "\nr1 joined...%d", r1);
 116:	83 c4 0c             	add    $0xc,%esp
 119:	50                   	push   %eax
 11a:	68 82 09 00 00       	push   $0x982
 11f:	6a 01                	push   $0x1
 121:	e8 ba 04 00 00       	call   5e0 <printf>

  r2 = thread_join(t2, (void **) &retv2);
 126:	58                   	pop    %eax
 127:	8d 45 e0             	lea    -0x20(%ebp),%eax
 12a:	5a                   	pop    %edx
 12b:	50                   	push   %eax
 12c:	56                   	push   %esi
 12d:	e8 f0 03 00 00       	call   522 <thread_join>
    printf(1, "\nr2 joined... %d", r2);
 132:	83 c4 0c             	add    $0xc,%esp
 135:	50                   	push   %eax
 136:	68 92 09 00 00       	push   $0x992
 13b:	6a 01                	push   $0x1
 13d:	e8 9e 04 00 00       	call   5e0 <printf>

  r3 = thread_join(t3, (void **) &retv3);
 142:	59                   	pop    %ecx
 143:	58                   	pop    %eax
 144:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 147:	50                   	push   %eax
 148:	53                   	push   %ebx
 149:	e8 d4 03 00 00       	call   522 <thread_join>
    printf(1, "\nr3 joined... %d", r3);
 14e:	83 c4 0c             	add    $0xc,%esp
 151:	50                   	push   %eax
 152:	68 a3 09 00 00       	push   $0x9a3
 157:	6a 01                	push   $0x1
 159:	e8 82 04 00 00       	call   5e0 <printf>

  printf(1, "\nThreads finished: (%d):%d, (%d):%d, (%d):%d, shared balance : %d\n", 
 15e:	58                   	pop    %eax
 15f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 162:	ff 35 c4 0c 00 00    	pushl  0xcc4
 168:	ff 30                	pushl  (%eax)
 16a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 16d:	53                   	push   %ebx
 16e:	ff 30                	pushl  (%eax)
 170:	8b 45 dc             	mov    -0x24(%ebp),%eax
 173:	56                   	push   %esi
 174:	ff 30                	pushl  (%eax)
 176:	57                   	push   %edi
 177:	68 b4 09 00 00       	push   $0x9b4
 17c:	6a 01                	push   $0x1
 17e:	e8 5d 04 00 00       	call   5e0 <printf>
      t1, *retv1, t2, *retv2, t3, *retv3, shared);

  exit();
 183:	83 c4 30             	add    $0x30,%esp
 186:	e8 d7 02 00 00       	call   462 <exit>
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <test>:
	
};



void test(void* ab){
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
 196:	83 ec 10             	sub    $0x10,%esp
 199:	8b 7d 08             	mov    0x8(%ebp),%edi
	int i, j;

	int temp;
	struct add * ptr = (struct add *) ab;
	printf(1,"thread id = %d started\n", ptr->id);
 19c:	ff 37                	pushl  (%edi)
 19e:	68 00 09 00 00       	push   $0x900
 1a3:	6a 01                	push   $0x1
 1a5:	e8 36 04 00 00       	call   5e0 <printf>
 1aa:	8b 35 c4 0c 00 00    	mov    0xcc4,%esi
 1b0:	83 c4 10             	add    $0x10,%esp
 1b3:	8d 5e 0a             	lea    0xa(%esi),%ebx
 1b6:	8d 76 00             	lea    0x0(%esi),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	
};



void test(void* ab){
 1c0:	b8 80 1a 06 00       	mov    $0x61a80,%eax
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
	int temp;
	struct add * ptr = (struct add *) ab;
	printf(1,"thread id = %d started\n", ptr->id);
	for(i=0;i<10;i++){
		for(j=0; j<400000; j++) 
			__asm("nop")	;		
 1c8:	90                   	nop

	int temp;
	struct add * ptr = (struct add *) ab;
	printf(1,"thread id = %d started\n", ptr->id);
	for(i=0;i<10;i++){
		for(j=0; j<400000; j++) 
 1c9:	83 e8 01             	sub    $0x1,%eax
 1cc:	75 fa                	jne    1c8 <test+0x38>
			__asm("nop")	;		
		temp = shared;
		for(j=0; j<400000; j++) ;		
		sleep(5);
 1ce:	83 ec 0c             	sub    $0xc,%esp
		temp = temp+1;
 1d1:	83 c6 01             	add    $0x1,%esi
	for(i=0;i<10;i++){
		for(j=0; j<400000; j++) 
			__asm("nop")	;		
		temp = shared;
		for(j=0; j<400000; j++) ;		
		sleep(5);
 1d4:	6a 05                	push   $0x5
 1d6:	e8 17 03 00 00       	call   4f2 <sleep>
		temp = temp+1;
		sleep(5);
 1db:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 1e2:	e8 0b 03 00 00       	call   4f2 <sleep>
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	b8 80 1a 06 00       	mov    $0x61a80,%eax
 1ef:	90                   	nop
		for(j=0; j<400000; j++) 
			__asm("nop")	;		
 1f0:	90                   	nop
		temp = shared;
		for(j=0; j<400000; j++) ;		
		sleep(5);
		temp = temp+1;
		sleep(5);
		for(j=0; j<400000; j++) 
 1f1:	83 e8 01             	sub    $0x1,%eax
 1f4:	75 fa                	jne    1f0 <test+0x60>
	int i, j;

	int temp;
	struct add * ptr = (struct add *) ab;
	printf(1,"thread id = %d started\n", ptr->id);
	for(i=0;i<10;i++){
 1f6:	39 de                	cmp    %ebx,%esi
		sleep(5);
		temp = temp+1;
		sleep(5);
		for(j=0; j<400000; j++) 
			__asm("nop")	;		
		shared=temp;
 1f8:	89 35 c4 0c 00 00    	mov    %esi,0xcc4
	int i, j;

	int temp;
	struct add * ptr = (struct add *) ab;
	printf(1,"thread id = %d started\n", ptr->id);
	for(i=0;i<10;i++){
 1fe:	75 c0                	jne    1c0 <test+0x30>
		for(j=0; j<400000; j++) 
			__asm("nop")	;		
		shared=temp;
	}
	
	printf(1,"thread id = %d ended\n", ptr->id);
 200:	83 ec 04             	sub    $0x4,%esp
 203:	ff 37                	pushl  (%edi)
 205:	68 18 09 00 00       	push   $0x918
 20a:	6a 01                	push   $0x1
 20c:	e8 cf 03 00 00       	call   5e0 <printf>

	exit();
 211:	e8 4c 02 00 00       	call   462 <exit>
 216:	66 90                	xchg   %ax,%ax
 218:	66 90                	xchg   %ax,%ax
 21a:	66 90                	xchg   %ax,%ax
 21c:	66 90                	xchg   %ax,%ax
 21e:	66 90                	xchg   %ax,%ax

00000220 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 22a:	89 c2                	mov    %eax,%edx
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 c1 01             	add    $0x1,%ecx
 233:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 237:	83 c2 01             	add    $0x1,%edx
 23a:	84 db                	test   %bl,%bl
 23c:	88 5a ff             	mov    %bl,-0x1(%edx)
 23f:	75 ef                	jne    230 <strcpy+0x10>
    ;
  return os;
}
 241:	5b                   	pop    %ebx
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
 244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 24a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000250 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
 255:	8b 55 08             	mov    0x8(%ebp),%edx
 258:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 25b:	0f b6 02             	movzbl (%edx),%eax
 25e:	0f b6 19             	movzbl (%ecx),%ebx
 261:	84 c0                	test   %al,%al
 263:	75 1e                	jne    283 <strcmp+0x33>
 265:	eb 29                	jmp    290 <strcmp+0x40>
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 270:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 273:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 276:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 279:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 27d:	84 c0                	test   %al,%al
 27f:	74 0f                	je     290 <strcmp+0x40>
 281:	89 f1                	mov    %esi,%ecx
 283:	38 d8                	cmp    %bl,%al
 285:	74 e9                	je     270 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 287:	29 d8                	sub    %ebx,%eax
}
 289:	5b                   	pop    %ebx
 28a:	5e                   	pop    %esi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 290:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 292:	29 d8                	sub    %ebx,%eax
}
 294:	5b                   	pop    %ebx
 295:	5e                   	pop    %esi
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	90                   	nop
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strlen>:

uint
strlen(char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2a6:	80 39 00             	cmpb   $0x0,(%ecx)
 2a9:	74 12                	je     2bd <strlen+0x1d>
 2ab:	31 d2                	xor    %edx,%edx
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 2bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	eb 0d                	jmp    2d0 <memset>
 2c3:	90                   	nop
 2c4:	90                   	nop
 2c5:	90                   	nop
 2c6:	90                   	nop
 2c7:	90                   	nop
 2c8:	90                   	nop
 2c9:	90                   	nop
 2ca:	90                   	nop
 2cb:	90                   	nop
 2cc:	90                   	nop
 2cd:	90                   	nop
 2ce:	90                   	nop
 2cf:	90                   	nop

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 d7                	mov    %edx,%edi
 2df:	fc                   	cld    
 2e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e2:	89 d0                	mov    %edx,%eax
 2e4:	5f                   	pop    %edi
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2fa:	0f b6 10             	movzbl (%eax),%edx
 2fd:	84 d2                	test   %dl,%dl
 2ff:	74 1d                	je     31e <strchr+0x2e>
    if(*s == c)
 301:	38 d3                	cmp    %dl,%bl
 303:	89 d9                	mov    %ebx,%ecx
 305:	75 0d                	jne    314 <strchr+0x24>
 307:	eb 17                	jmp    320 <strchr+0x30>
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 310:	38 ca                	cmp    %cl,%dl
 312:	74 0c                	je     320 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 314:	83 c0 01             	add    $0x1,%eax
 317:	0f b6 10             	movzbl (%eax),%edx
 31a:	84 d2                	test   %dl,%dl
 31c:	75 f2                	jne    310 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 31e:	31 c0                	xor    %eax,%eax
}
 320:	5b                   	pop    %ebx
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 336:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 338:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 33b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 33e:	eb 29                	jmp    369 <gets+0x39>
    cc = read(0, &c, 1);
 340:	83 ec 04             	sub    $0x4,%esp
 343:	6a 01                	push   $0x1
 345:	57                   	push   %edi
 346:	6a 00                	push   $0x0
 348:	e8 2d 01 00 00       	call   47a <read>
    if(cc < 1)
 34d:	83 c4 10             	add    $0x10,%esp
 350:	85 c0                	test   %eax,%eax
 352:	7e 1d                	jle    371 <gets+0x41>
      break;
    buf[i++] = c;
 354:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 358:	8b 55 08             	mov    0x8(%ebp),%edx
 35b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 35d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 35f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 363:	74 1b                	je     380 <gets+0x50>
 365:	3c 0d                	cmp    $0xd,%al
 367:	74 17                	je     380 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 369:	8d 5e 01             	lea    0x1(%esi),%ebx
 36c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 36f:	7c cf                	jl     340 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 378:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37b:	5b                   	pop    %ebx
 37c:	5e                   	pop    %esi
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 380:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 383:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 385:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 389:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5f                   	pop    %edi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    
 391:	eb 0d                	jmp    3a0 <stat>
 393:	90                   	nop
 394:	90                   	nop
 395:	90                   	nop
 396:	90                   	nop
 397:	90                   	nop
 398:	90                   	nop
 399:	90                   	nop
 39a:	90                   	nop
 39b:	90                   	nop
 39c:	90                   	nop
 39d:	90                   	nop
 39e:	90                   	nop
 39f:	90                   	nop

000003a0 <stat>:

int
stat(char *n, struct stat *st)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a5:	83 ec 08             	sub    $0x8,%esp
 3a8:	6a 00                	push   $0x0
 3aa:	ff 75 08             	pushl  0x8(%ebp)
 3ad:	e8 f0 00 00 00       	call   4a2 <open>
  if(fd < 0)
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	85 c0                	test   %eax,%eax
 3b7:	78 27                	js     3e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3b9:	83 ec 08             	sub    $0x8,%esp
 3bc:	ff 75 0c             	pushl  0xc(%ebp)
 3bf:	89 c3                	mov    %eax,%ebx
 3c1:	50                   	push   %eax
 3c2:	e8 f3 00 00 00       	call   4ba <fstat>
 3c7:	89 c6                	mov    %eax,%esi
  close(fd);
 3c9:	89 1c 24             	mov    %ebx,(%esp)
 3cc:	e8 b9 00 00 00       	call   48a <close>
  return r;
 3d1:	83 c4 10             	add    $0x10,%esp
 3d4:	89 f0                	mov    %esi,%eax
}
 3d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d9:	5b                   	pop    %ebx
 3da:	5e                   	pop    %esi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3e5:	eb ef                	jmp    3d6 <stat+0x36>
 3e7:	89 f6                	mov    %esi,%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3f7:	0f be 11             	movsbl (%ecx),%edx
 3fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 3fd:	3c 09                	cmp    $0x9,%al
 3ff:	b8 00 00 00 00       	mov    $0x0,%eax
 404:	77 1f                	ja     425 <atoi+0x35>
 406:	8d 76 00             	lea    0x0(%esi),%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 410:	8d 04 80             	lea    (%eax,%eax,4),%eax
 413:	83 c1 01             	add    $0x1,%ecx
 416:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 41a:	0f be 11             	movsbl (%ecx),%edx
 41d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 420:	80 fb 09             	cmp    $0x9,%bl
 423:	76 eb                	jbe    410 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 425:	5b                   	pop    %ebx
 426:	5d                   	pop    %ebp
 427:	c3                   	ret    
 428:	90                   	nop
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	8b 5d 10             	mov    0x10(%ebp),%ebx
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 43e:	85 db                	test   %ebx,%ebx
 440:	7e 14                	jle    456 <memmove+0x26>
 442:	31 d2                	xor    %edx,%edx
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 448:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 44c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 44f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 452:	39 da                	cmp    %ebx,%edx
 454:	75 f2                	jne    448 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 456:	5b                   	pop    %ebx
 457:	5e                   	pop    %esi
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45a:	b8 01 00 00 00       	mov    $0x1,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <exit>:
SYSCALL(exit)
 462:	b8 02 00 00 00       	mov    $0x2,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <wait>:
SYSCALL(wait)
 46a:	b8 03 00 00 00       	mov    $0x3,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <pipe>:
SYSCALL(pipe)
 472:	b8 04 00 00 00       	mov    $0x4,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <read>:
SYSCALL(read)
 47a:	b8 05 00 00 00       	mov    $0x5,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <write>:
SYSCALL(write)
 482:	b8 10 00 00 00       	mov    $0x10,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <close>:
SYSCALL(close)
 48a:	b8 15 00 00 00       	mov    $0x15,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <kill>:
SYSCALL(kill)
 492:	b8 06 00 00 00       	mov    $0x6,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <exec>:
SYSCALL(exec)
 49a:	b8 07 00 00 00       	mov    $0x7,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <open>:
SYSCALL(open)
 4a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <mknod>:
SYSCALL(mknod)
 4aa:	b8 11 00 00 00       	mov    $0x11,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <unlink>:
SYSCALL(unlink)
 4b2:	b8 12 00 00 00       	mov    $0x12,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <fstat>:
SYSCALL(fstat)
 4ba:	b8 08 00 00 00       	mov    $0x8,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <link>:
SYSCALL(link)
 4c2:	b8 13 00 00 00       	mov    $0x13,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <mkdir>:
SYSCALL(mkdir)
 4ca:	b8 14 00 00 00       	mov    $0x14,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <chdir>:
SYSCALL(chdir)
 4d2:	b8 09 00 00 00       	mov    $0x9,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <dup>:
SYSCALL(dup)
 4da:	b8 0a 00 00 00       	mov    $0xa,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <getpid>:
SYSCALL(getpid)
 4e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <sbrk>:
SYSCALL(sbrk)
 4ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <sleep>:
SYSCALL(sleep)
 4f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <uptime>:
SYSCALL(uptime)
 4fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <cps>:
SYSCALL(cps)
 502:	b8 16 00 00 00       	mov    $0x16,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <chpr>:
SYSCALL(chpr)
 50a:	b8 17 00 00 00       	mov    $0x17,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <clone>:
SYSCALL(clone)
 512:	b8 1b 00 00 00       	mov    $0x1b,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <thread_exit>:
SYSCALL(thread_exit)
 51a:	b8 18 00 00 00       	mov    $0x18,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <thread_join>:
SYSCALL(thread_join)
 522:	b8 19 00 00 00       	mov    $0x19,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <gettid>:
SYSCALL(gettid)
 52a:	b8 1a 00 00 00       	mov    $0x1a,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <thread_create>:
SYSCALL(thread_create)
 532:	b8 19 00 00 00       	mov    $0x19,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    
 53a:	66 90                	xchg   %ax,%ax
 53c:	66 90                	xchg   %ax,%ax
 53e:	66 90                	xchg   %ax,%ax

00000540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	89 c6                	mov    %eax,%esi
 548:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 54b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 54e:	85 db                	test   %ebx,%ebx
 550:	74 7e                	je     5d0 <printint+0x90>
 552:	89 d0                	mov    %edx,%eax
 554:	c1 e8 1f             	shr    $0x1f,%eax
 557:	84 c0                	test   %al,%al
 559:	74 75                	je     5d0 <printint+0x90>
    neg = 1;
    x = -xx;
 55b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 55d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 564:	f7 d8                	neg    %eax
 566:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 569:	31 ff                	xor    %edi,%edi
 56b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 56e:	89 ce                	mov    %ecx,%esi
 570:	eb 08                	jmp    57a <printint+0x3a>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 578:	89 cf                	mov    %ecx,%edi
 57a:	31 d2                	xor    %edx,%edx
 57c:	8d 4f 01             	lea    0x1(%edi),%ecx
 57f:	f7 f6                	div    %esi
 581:	0f b6 92 00 0a 00 00 	movzbl 0xa00(%edx),%edx
  }while((x /= base) != 0);
 588:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 58a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 58d:	75 e9                	jne    578 <printint+0x38>
  if(neg)
 58f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 592:	8b 75 c0             	mov    -0x40(%ebp),%esi
 595:	85 c0                	test   %eax,%eax
 597:	74 08                	je     5a1 <printint+0x61>
    buf[i++] = '-';
 599:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 59e:	8d 4f 02             	lea    0x2(%edi),%ecx
 5a1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 5a5:	8d 76 00             	lea    0x0(%esi),%esi
 5a8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ab:	83 ec 04             	sub    $0x4,%esp
 5ae:	83 ef 01             	sub    $0x1,%edi
 5b1:	6a 01                	push   $0x1
 5b3:	53                   	push   %ebx
 5b4:	56                   	push   %esi
 5b5:	88 45 d7             	mov    %al,-0x29(%ebp)
 5b8:	e8 c5 fe ff ff       	call   482 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5bd:	83 c4 10             	add    $0x10,%esp
 5c0:	39 df                	cmp    %ebx,%edi
 5c2:	75 e4                	jne    5a8 <printint+0x68>
    putc(fd, buf[i]);
}
 5c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c7:	5b                   	pop    %ebx
 5c8:	5e                   	pop    %esi
 5c9:	5f                   	pop    %edi
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5d0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5d2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5d9:	eb 8b                	jmp    566 <printint+0x26>
 5db:	90                   	nop
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5e9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ec:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f5:	0f b6 1e             	movzbl (%esi),%ebx
 5f8:	83 c6 01             	add    $0x1,%esi
 5fb:	84 db                	test   %bl,%bl
 5fd:	0f 84 b0 00 00 00    	je     6b3 <printf+0xd3>
 603:	31 d2                	xor    %edx,%edx
 605:	eb 39                	jmp    640 <printf+0x60>
 607:	89 f6                	mov    %esi,%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 610:	83 f8 25             	cmp    $0x25,%eax
 613:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 616:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 61b:	74 18                	je     635 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 620:	83 ec 04             	sub    $0x4,%esp
 623:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 626:	6a 01                	push   $0x1
 628:	50                   	push   %eax
 629:	57                   	push   %edi
 62a:	e8 53 fe ff ff       	call   482 <write>
 62f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 632:	83 c4 10             	add    $0x10,%esp
 635:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 638:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 63c:	84 db                	test   %bl,%bl
 63e:	74 73                	je     6b3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 640:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 642:	0f be cb             	movsbl %bl,%ecx
 645:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 648:	74 c6                	je     610 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 64a:	83 fa 25             	cmp    $0x25,%edx
 64d:	75 e6                	jne    635 <printf+0x55>
      if(c == 'd'){
 64f:	83 f8 64             	cmp    $0x64,%eax
 652:	0f 84 f8 00 00 00    	je     750 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 658:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 65e:	83 f9 70             	cmp    $0x70,%ecx
 661:	74 5d                	je     6c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 663:	83 f8 73             	cmp    $0x73,%eax
 666:	0f 84 84 00 00 00    	je     6f0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 66c:	83 f8 63             	cmp    $0x63,%eax
 66f:	0f 84 ea 00 00 00    	je     75f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 675:	83 f8 25             	cmp    $0x25,%eax
 678:	0f 84 c2 00 00 00    	je     740 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 681:	83 ec 04             	sub    $0x4,%esp
 684:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 688:	6a 01                	push   $0x1
 68a:	50                   	push   %eax
 68b:	57                   	push   %edi
 68c:	e8 f1 fd ff ff       	call   482 <write>
 691:	83 c4 0c             	add    $0xc,%esp
 694:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 697:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 69a:	6a 01                	push   $0x1
 69c:	50                   	push   %eax
 69d:	57                   	push   %edi
 69e:	83 c6 01             	add    $0x1,%esi
 6a1:	e8 dc fd ff ff       	call   482 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6aa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ad:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6af:	84 db                	test   %bl,%bl
 6b1:	75 8d                	jne    640 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b6:	5b                   	pop    %ebx
 6b7:	5e                   	pop    %esi
 6b8:	5f                   	pop    %edi
 6b9:	5d                   	pop    %ebp
 6ba:	c3                   	ret    
 6bb:	90                   	nop
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c8:	6a 00                	push   $0x0
 6ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6cd:	89 f8                	mov    %edi,%eax
 6cf:	8b 13                	mov    (%ebx),%edx
 6d1:	e8 6a fe ff ff       	call   540 <printint>
        ap++;
 6d6:	89 d8                	mov    %ebx,%eax
 6d8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6db:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 6dd:	83 c0 04             	add    $0x4,%eax
 6e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e3:	e9 4d ff ff ff       	jmp    635 <printf+0x55>
 6e8:	90                   	nop
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 6f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6f3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6f5:	83 c0 04             	add    $0x4,%eax
 6f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 6fb:	b8 f8 09 00 00       	mov    $0x9f8,%eax
 700:	85 db                	test   %ebx,%ebx
 702:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 705:	0f b6 03             	movzbl (%ebx),%eax
 708:	84 c0                	test   %al,%al
 70a:	74 23                	je     72f <printf+0x14f>
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 710:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 713:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 716:	83 ec 04             	sub    $0x4,%esp
 719:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 71b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 71e:	50                   	push   %eax
 71f:	57                   	push   %edi
 720:	e8 5d fd ff ff       	call   482 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 725:	0f b6 03             	movzbl (%ebx),%eax
 728:	83 c4 10             	add    $0x10,%esp
 72b:	84 c0                	test   %al,%al
 72d:	75 e1                	jne    710 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 72f:	31 d2                	xor    %edx,%edx
 731:	e9 ff fe ff ff       	jmp    635 <printf+0x55>
 736:	8d 76 00             	lea    0x0(%esi),%esi
 739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 746:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 749:	6a 01                	push   $0x1
 74b:	e9 4c ff ff ff       	jmp    69c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 0a 00 00 00       	mov    $0xa,%ecx
 758:	6a 01                	push   $0x1
 75a:	e9 6b ff ff ff       	jmp    6ca <printf+0xea>
 75f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 762:	83 ec 04             	sub    $0x4,%esp
 765:	8b 03                	mov    (%ebx),%eax
 767:	6a 01                	push   $0x1
 769:	88 45 e4             	mov    %al,-0x1c(%ebp)
 76c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 76f:	50                   	push   %eax
 770:	57                   	push   %edi
 771:	e8 0c fd ff ff       	call   482 <write>
 776:	e9 5b ff ff ff       	jmp    6d6 <printf+0xf6>
 77b:	66 90                	xchg   %ax,%ax
 77d:	66 90                	xchg   %ax,%ax
 77f:	90                   	nop

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	a1 c8 0c 00 00       	mov    0xcc8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 786:	89 e5                	mov    %esp,%ebp
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	53                   	push   %ebx
 78b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 790:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 793:	39 c8                	cmp    %ecx,%eax
 795:	73 19                	jae    7b0 <free+0x30>
 797:	89 f6                	mov    %esi,%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 7a0:	39 d1                	cmp    %edx,%ecx
 7a2:	72 1c                	jb     7c0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a4:	39 d0                	cmp    %edx,%eax
 7a6:	73 18                	jae    7c0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7aa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ae:	72 f0                	jb     7a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 d0                	cmp    %edx,%eax
 7b2:	72 f4                	jb     7a8 <free+0x28>
 7b4:	39 d1                	cmp    %edx,%ecx
 7b6:	73 f0                	jae    7a8 <free+0x28>
 7b8:	90                   	nop
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7c6:	39 d7                	cmp    %edx,%edi
 7c8:	74 19                	je     7e3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d3:	39 f1                	cmp    %esi,%ecx
 7d5:	74 23                	je     7fa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7d7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7d9:	a3 c8 0c 00 00       	mov    %eax,0xcc8
}
 7de:	5b                   	pop    %ebx
 7df:	5e                   	pop    %esi
 7e0:	5f                   	pop    %edi
 7e1:	5d                   	pop    %ebp
 7e2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7e3:	03 72 04             	add    0x4(%edx),%esi
 7e6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e9:	8b 10                	mov    (%eax),%edx
 7eb:	8b 12                	mov    (%edx),%edx
 7ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7f0:	8b 50 04             	mov    0x4(%eax),%edx
 7f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f6:	39 f1                	cmp    %esi,%ecx
 7f8:	75 dd                	jne    7d7 <free+0x57>
    p->s.size += bp->s.size;
 7fa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 7fd:	a3 c8 0c 00 00       	mov    %eax,0xcc8
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 802:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 805:	8b 53 f8             	mov    -0x8(%ebx),%edx
 808:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 80a:	5b                   	pop    %ebx
 80b:	5e                   	pop    %esi
 80c:	5f                   	pop    %edi
 80d:	5d                   	pop    %ebp
 80e:	c3                   	ret    
 80f:	90                   	nop

00000810 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 819:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 81c:	8b 15 c8 0c 00 00    	mov    0xcc8,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 822:	8d 78 07             	lea    0x7(%eax),%edi
 825:	c1 ef 03             	shr    $0x3,%edi
 828:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 82b:	85 d2                	test   %edx,%edx
 82d:	0f 84 a3 00 00 00    	je     8d6 <malloc+0xc6>
 833:	8b 02                	mov    (%edx),%eax
 835:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 838:	39 cf                	cmp    %ecx,%edi
 83a:	76 74                	jbe    8b0 <malloc+0xa0>
 83c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 842:	be 00 10 00 00       	mov    $0x1000,%esi
 847:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 84e:	0f 43 f7             	cmovae %edi,%esi
 851:	ba 00 80 00 00       	mov    $0x8000,%edx
 856:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 85c:	0f 46 da             	cmovbe %edx,%ebx
 85f:	eb 10                	jmp    871 <malloc+0x61>
 861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 868:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 86a:	8b 48 04             	mov    0x4(%eax),%ecx
 86d:	39 cf                	cmp    %ecx,%edi
 86f:	76 3f                	jbe    8b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 871:	39 05 c8 0c 00 00    	cmp    %eax,0xcc8
 877:	89 c2                	mov    %eax,%edx
 879:	75 ed                	jne    868 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 87b:	83 ec 0c             	sub    $0xc,%esp
 87e:	53                   	push   %ebx
 87f:	e8 66 fc ff ff       	call   4ea <sbrk>
  if(p == (char*)-1)
 884:	83 c4 10             	add    $0x10,%esp
 887:	83 f8 ff             	cmp    $0xffffffff,%eax
 88a:	74 1c                	je     8a8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 88c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 88f:	83 ec 0c             	sub    $0xc,%esp
 892:	83 c0 08             	add    $0x8,%eax
 895:	50                   	push   %eax
 896:	e8 e5 fe ff ff       	call   780 <free>
  return freep;
 89b:	8b 15 c8 0c 00 00    	mov    0xcc8,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 8a1:	83 c4 10             	add    $0x10,%esp
 8a4:	85 d2                	test   %edx,%edx
 8a6:	75 c0                	jne    868 <malloc+0x58>
        return 0;
 8a8:	31 c0                	xor    %eax,%eax
 8aa:	eb 1c                	jmp    8c8 <malloc+0xb8>
 8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8b0:	39 cf                	cmp    %ecx,%edi
 8b2:	74 1c                	je     8d0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8b4:	29 f9                	sub    %edi,%ecx
 8b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8bc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 8bf:	89 15 c8 0c 00 00    	mov    %edx,0xcc8
      return (void*)(p + 1);
 8c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8cb:	5b                   	pop    %ebx
 8cc:	5e                   	pop    %esi
 8cd:	5f                   	pop    %edi
 8ce:	5d                   	pop    %ebp
 8cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb e9                	jmp    8bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8d6:	c7 05 c8 0c 00 00 cc 	movl   $0xccc,0xcc8
 8dd:	0c 00 00 
 8e0:	c7 05 cc 0c 00 00 cc 	movl   $0xccc,0xccc
 8e7:	0c 00 00 
    base.s.size = 0;
 8ea:	b8 cc 0c 00 00       	mov    $0xccc,%eax
 8ef:	c7 05 d0 0c 00 00 00 	movl   $0x0,0xcd0
 8f6:	00 00 00 
 8f9:	e9 3e ff ff ff       	jmp    83c <malloc+0x2c>
