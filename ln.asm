
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
  if(argc != 3){
   a:	83 39 03             	cmpl   $0x3,(%ecx)
{
   d:	55                   	push   %ebp
   e:	89 e5                	mov    %esp,%ebp
  10:	53                   	push   %ebx
  11:	51                   	push   %ecx
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 48 07 00 00       	push   $0x748
  1e:	6a 02                	push   $0x2
  20:	e8 fb 03 00 00       	call   420 <printf>
    exit();
  25:	e8 89 02 00 00       	call   2b3 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	push   0x8(%ebx)
  2f:	ff 73 04             	push   0x4(%ebx)
  32:	e8 dc 02 00 00       	call   313 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 70 02 00 00       	call   2b3 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	push   0x8(%ebx)
  46:	ff 73 04             	push   0x4(%ebx)
  49:	68 5b 07 00 00       	push   $0x75b
  4e:	6a 02                	push   $0x2
  50:	e8 cb 03 00 00       	call   420 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave  
  84:	c3                   	ret    
  85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a7:	90                   	nop
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
    p++, q++;
  b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave  
  c5:	c3                   	ret    
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave  
  dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave  
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	57                   	push   %edi
 196:	6a 00                	push   $0x0
 198:	e8 2e 01 00 00       	call   2cb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 1d                	je     1d0 <gets+0x50>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 19                	je     1d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1b7:	89 de                	mov    %ebx,%esi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    
  buf[i] = '\0';
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	89 de                	mov    %ebx,%esi
 1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave  
 27b:	c3                   	ret    
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <cps>:
SYSCALL(cps)
 353:	b8 16 00 00 00       	mov    $0x16,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <chpr>:
SYSCALL(chpr)
 35b:	b8 17 00 00 00       	mov    $0x17,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    
 363:	66 90                	xchg   %ax,%ax
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 3c             	sub    $0x3c,%esp
 379:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 37c:	89 d1                	mov    %edx,%ecx
{
 37e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 381:	85 d2                	test   %edx,%edx
 383:	0f 89 7f 00 00 00    	jns    408 <printint+0x98>
 389:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 38d:	74 79                	je     408 <printint+0x98>
    neg = 1;
 38f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 396:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 398:	31 db                	xor    %ebx,%ebx
 39a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 cf                	mov    %ecx,%edi
 3a6:	f7 75 c4             	divl   -0x3c(%ebp)
 3a9:	0f b6 92 d0 07 00 00 	movzbl 0x7d0(%edx),%edx
 3b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3b3:	89 d8                	mov    %ebx,%eax
 3b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3c1:	76 dd                	jbe    3a0 <printint+0x30>
  if(neg)
 3c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3c6:	85 c9                	test   %ecx,%ecx
 3c8:	74 0c                	je     3d6 <printint+0x66>
    buf[i++] = '-';
 3ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3dd:	eb 07                	jmp    3e6 <printint+0x76>
 3df:	90                   	nop
    putc(fd, buf[i]);
 3e0:	0f b6 13             	movzbl (%ebx),%edx
 3e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3e6:	83 ec 04             	sub    $0x4,%esp
 3e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ec:	6a 01                	push   $0x1
 3ee:	56                   	push   %esi
 3ef:	57                   	push   %edi
 3f0:	e8 de fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 3f5:	83 c4 10             	add    $0x10,%esp
 3f8:	39 de                	cmp    %ebx,%esi
 3fa:	75 e4                	jne    3e0 <printint+0x70>
}
 3fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ff:	5b                   	pop    %ebx
 400:	5e                   	pop    %esi
 401:	5f                   	pop    %edi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 408:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 40f:	eb 87                	jmp    398 <printint+0x28>
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 42c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 42f:	0f b6 13             	movzbl (%ebx),%edx
 432:	84 d2                	test   %dl,%dl
 434:	74 6a                	je     4a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 436:	8d 45 10             	lea    0x10(%ebp),%eax
 439:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 43c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 43f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 441:	89 45 d0             	mov    %eax,-0x30(%ebp)
 444:	eb 36                	jmp    47c <printf+0x5c>
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 453:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 458:	83 f8 25             	cmp    $0x25,%eax
 45b:	74 15                	je     472 <printf+0x52>
  write(fd, &c, 1);
 45d:	83 ec 04             	sub    $0x4,%esp
 460:	88 55 e7             	mov    %dl,-0x19(%ebp)
 463:	6a 01                	push   $0x1
 465:	57                   	push   %edi
 466:	56                   	push   %esi
 467:	e8 67 fe ff ff       	call   2d3 <write>
 46c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 46f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 472:	0f b6 13             	movzbl (%ebx),%edx
 475:	83 c3 01             	add    $0x1,%ebx
 478:	84 d2                	test   %dl,%dl
 47a:	74 24                	je     4a0 <printf+0x80>
    c = fmt[i] & 0xff;
 47c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 47f:	85 c9                	test   %ecx,%ecx
 481:	74 cd                	je     450 <printf+0x30>
      }
    } else if(state == '%'){
 483:	83 f9 25             	cmp    $0x25,%ecx
 486:	75 ea                	jne    472 <printf+0x52>
      if(c == 'd'){
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	0f 84 07 01 00 00    	je     598 <printf+0x178>
 491:	83 e8 63             	sub    $0x63,%eax
 494:	83 f8 15             	cmp    $0x15,%eax
 497:	77 17                	ja     4b0 <printf+0x90>
 499:	ff 24 85 78 07 00 00 	jmp    *0x778(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a3:	5b                   	pop    %ebx
 4a4:	5e                   	pop    %esi
 4a5:	5f                   	pop    %edi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
  write(fd, &c, 1);
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4b6:	6a 01                	push   $0x1
 4b8:	57                   	push   %edi
 4b9:	56                   	push   %esi
 4ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4be:	e8 10 fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4c7:	83 c4 0c             	add    $0xc,%esp
 4ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4cd:	6a 01                	push   $0x1
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	e8 fd fd ff ff       	call   2d3 <write>
        putc(fd, c);
 4d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4d9:	31 c9                	xor    %ecx,%ecx
 4db:	eb 95                	jmp    472 <printf+0x52>
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4e0:	83 ec 0c             	sub    $0xc,%esp
 4e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e8:	6a 00                	push   $0x0
 4ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4ed:	8b 10                	mov    (%eax),%edx
 4ef:	89 f0                	mov    %esi,%eax
 4f1:	e8 7a fe ff ff       	call   370 <printint>
        ap++;
 4f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4fd:	31 c9                	xor    %ecx,%ecx
 4ff:	e9 6e ff ff ff       	jmp    472 <printf+0x52>
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 508:	8b 45 d0             	mov    -0x30(%ebp),%eax
 50b:	8b 10                	mov    (%eax),%edx
        ap++;
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 513:	85 d2                	test   %edx,%edx
 515:	0f 84 8d 00 00 00    	je     5a8 <printf+0x188>
        while(*s != 0){
 51b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 51e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 520:	84 c0                	test   %al,%al
 522:	0f 84 4a ff ff ff    	je     472 <printf+0x52>
 528:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 52b:	89 d3                	mov    %edx,%ebx
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
          s++;
 533:	83 c3 01             	add    $0x1,%ebx
 536:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 539:	6a 01                	push   $0x1
 53b:	57                   	push   %edi
 53c:	56                   	push   %esi
 53d:	e8 91 fd ff ff       	call   2d3 <write>
        while(*s != 0){
 542:	0f b6 03             	movzbl (%ebx),%eax
 545:	83 c4 10             	add    $0x10,%esp
 548:	84 c0                	test   %al,%al
 54a:	75 e4                	jne    530 <printf+0x110>
      state = 0;
 54c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 54f:	31 c9                	xor    %ecx,%ecx
 551:	e9 1c ff ff ff       	jmp    472 <printf+0x52>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 0a 00 00 00       	mov    $0xa,%ecx
 568:	6a 01                	push   $0x1
 56a:	e9 7b ff ff ff       	jmp    4ea <printf+0xca>
 56f:	90                   	nop
        putc(fd, *ap);
 570:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 573:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 576:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 578:	6a 01                	push   $0x1
 57a:	57                   	push   %edi
 57b:	56                   	push   %esi
        putc(fd, *ap);
 57c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 57f:	e8 4f fd ff ff       	call   2d3 <write>
        ap++;
 584:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 588:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58b:	31 c9                	xor    %ecx,%ecx
 58d:	e9 e0 fe ff ff       	jmp    472 <printf+0x52>
 592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 598:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 59b:	83 ec 04             	sub    $0x4,%esp
 59e:	e9 2a ff ff ff       	jmp    4cd <printf+0xad>
 5a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5a7:	90                   	nop
          s = "(null)";
 5a8:	ba 6f 07 00 00       	mov    $0x76f,%edx
        while(*s != 0){
 5ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5b0:	b8 28 00 00 00       	mov    $0x28,%eax
 5b5:	89 d3                	mov    %edx,%ebx
 5b7:	e9 74 ff ff ff       	jmp    530 <printf+0x110>
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 7c 0a 00 00       	mov    0xa7c,%eax
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	89 c2                	mov    %eax,%edx
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	39 ca                	cmp    %ecx,%edx
 5de:	73 30                	jae    610 <free+0x50>
 5e0:	39 c1                	cmp    %eax,%ecx
 5e2:	72 04                	jb     5e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e4:	39 c2                	cmp    %eax,%edx
 5e6:	72 f0                	jb     5d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ee:	39 f8                	cmp    %edi,%eax
 5f0:	74 30                	je     622 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5f5:	8b 42 04             	mov    0x4(%edx),%eax
 5f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5fb:	39 f1                	cmp    %esi,%ecx
 5fd:	74 3a                	je     639 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 601:	5b                   	pop    %ebx
  freep = p;
 602:	89 15 7c 0a 00 00    	mov    %edx,0xa7c
}
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 610:	39 c2                	cmp    %eax,%edx
 612:	72 c4                	jb     5d8 <free+0x18>
 614:	39 c1                	cmp    %eax,%ecx
 616:	73 c0                	jae    5d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 618:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 61e:	39 f8                	cmp    %edi,%eax
 620:	75 d0                	jne    5f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 622:	03 70 04             	add    0x4(%eax),%esi
 625:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 628:	8b 02                	mov    (%edx),%eax
 62a:	8b 00                	mov    (%eax),%eax
 62c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 62f:	8b 42 04             	mov    0x4(%edx),%eax
 632:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 635:	39 f1                	cmp    %esi,%ecx
 637:	75 c6                	jne    5ff <free+0x3f>
    p->s.size += bp->s.size;
 639:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 63c:	89 15 7c 0a 00 00    	mov    %edx,0xa7c
    p->s.size += bp->s.size;
 642:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 645:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 648:	89 0a                	mov    %ecx,(%edx)
}
 64a:	5b                   	pop    %ebx
 64b:	5e                   	pop    %esi
 64c:	5f                   	pop    %edi
 64d:	5d                   	pop    %ebp
 64e:	c3                   	ret    
 64f:	90                   	nop

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 65c:	8b 3d 7c 0a 00 00    	mov    0xa7c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	8d 70 07             	lea    0x7(%eax),%esi
 665:	c1 ee 03             	shr    $0x3,%esi
 668:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 66b:	85 ff                	test   %edi,%edi
 66d:	0f 84 9d 00 00 00    	je     710 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 673:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 675:	8b 4a 04             	mov    0x4(%edx),%ecx
 678:	39 f1                	cmp    %esi,%ecx
 67a:	73 6a                	jae    6e6 <malloc+0x96>
 67c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 681:	39 de                	cmp    %ebx,%esi
 683:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 686:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 68d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 690:	eb 17                	jmp    6a9 <malloc+0x59>
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 69a:	8b 48 04             	mov    0x4(%eax),%ecx
 69d:	39 f1                	cmp    %esi,%ecx
 69f:	73 4f                	jae    6f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a1:	8b 3d 7c 0a 00 00    	mov    0xa7c,%edi
 6a7:	89 c2                	mov    %eax,%edx
 6a9:	39 d7                	cmp    %edx,%edi
 6ab:	75 eb                	jne    698 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6ad:	83 ec 0c             	sub    $0xc,%esp
 6b0:	ff 75 e4             	push   -0x1c(%ebp)
 6b3:	e8 83 fc ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 6b8:	83 c4 10             	add    $0x10,%esp
 6bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6be:	74 1c                	je     6dc <malloc+0x8c>
  hp->s.size = nu;
 6c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	83 c0 08             	add    $0x8,%eax
 6c9:	50                   	push   %eax
 6ca:	e8 f1 fe ff ff       	call   5c0 <free>
  return freep;
 6cf:	8b 15 7c 0a 00 00    	mov    0xa7c,%edx
      if((p = morecore(nunits)) == 0)
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	85 d2                	test   %edx,%edx
 6da:	75 bc                	jne    698 <malloc+0x48>
        return 0;
  }
}
 6dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6df:	31 c0                	xor    %eax,%eax
}
 6e1:	5b                   	pop    %ebx
 6e2:	5e                   	pop    %esi
 6e3:	5f                   	pop    %edi
 6e4:	5d                   	pop    %ebp
 6e5:	c3                   	ret    
    if(p->s.size >= nunits){
 6e6:	89 d0                	mov    %edx,%eax
 6e8:	89 fa                	mov    %edi,%edx
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6f0:	39 ce                	cmp    %ecx,%esi
 6f2:	74 4c                	je     740 <malloc+0xf0>
        p->s.size -= nunits;
 6f4:	29 f1                	sub    %esi,%ecx
 6f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6ff:	89 15 7c 0a 00 00    	mov    %edx,0xa7c
}
 705:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 708:	83 c0 08             	add    $0x8,%eax
}
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 710:	c7 05 7c 0a 00 00 80 	movl   $0xa80,0xa7c
 717:	0a 00 00 
    base.s.size = 0;
 71a:	bf 80 0a 00 00       	mov    $0xa80,%edi
    base.s.ptr = freep = prevp = &base;
 71f:	c7 05 80 0a 00 00 80 	movl   $0xa80,0xa80
 726:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 729:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 72b:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 732:	00 00 00 
    if(p->s.size >= nunits){
 735:	e9 42 ff ff ff       	jmp    67c <malloc+0x2c>
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb b9                	jmp    6ff <malloc+0xaf>
