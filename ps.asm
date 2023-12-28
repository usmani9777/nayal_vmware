
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  cps();
   6:	e8 f8 02 00 00       	call   303 <cps>
  exit();
   b:	e8 53 02 00 00       	call   263 <exit>

00000010 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  10:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  11:	31 c0                	xor    %eax,%eax
{
  13:	89 e5                	mov    %esp,%ebp
  15:	53                   	push   %ebx
  16:	8b 4d 08             	mov    0x8(%ebp),%ecx
  19:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  20:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  24:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  27:	83 c0 01             	add    $0x1,%eax
  2a:	84 d2                	test   %dl,%dl
  2c:	75 f2                	jne    20 <strcpy+0x10>
    ;
  return os;
}
  2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  31:	89 c8                	mov    %ecx,%eax
  33:	c9                   	leave  
  34:	c3                   	ret    
  35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  44:	8b 55 08             	mov    0x8(%ebp),%edx
  47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  4a:	0f b6 02             	movzbl (%edx),%eax
  4d:	84 c0                	test   %al,%al
  4f:	75 17                	jne    68 <strcmp+0x28>
  51:	eb 3a                	jmp    8d <strcmp+0x4d>
  53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  57:	90                   	nop
  58:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  5c:	83 c2 01             	add    $0x1,%edx
  5f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  62:	84 c0                	test   %al,%al
  64:	74 1a                	je     80 <strcmp+0x40>
    p++, q++;
  66:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  68:	0f b6 19             	movzbl (%ecx),%ebx
  6b:	38 c3                	cmp    %al,%bl
  6d:	74 e9                	je     58 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  6f:	29 d8                	sub    %ebx,%eax
}
  71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  74:	c9                   	leave  
  75:	c3                   	ret    
  76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  7d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  80:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  84:	31 c0                	xor    %eax,%eax
  86:	29 d8                	sub    %ebx,%eax
}
  88:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8b:	c9                   	leave  
  8c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  8d:	0f b6 19             	movzbl (%ecx),%ebx
  90:	31 c0                	xor    %eax,%eax
  92:	eb db                	jmp    6f <strcmp+0x2f>
  94:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  9f:	90                   	nop

000000a0 <strlen>:

uint
strlen(const char *s)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  a6:	80 3a 00             	cmpb   $0x0,(%edx)
  a9:	74 15                	je     c0 <strlen+0x20>
  ab:	31 c0                	xor    %eax,%eax
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  b0:	83 c0 01             	add    $0x1,%eax
  b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  b7:	89 c1                	mov    %eax,%ecx
  b9:	75 f5                	jne    b0 <strlen+0x10>
    ;
  return n;
}
  bb:	89 c8                	mov    %ecx,%eax
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    
  bf:	90                   	nop
  for(n = 0; s[n]; n++)
  c0:	31 c9                	xor    %ecx,%ecx
}
  c2:	5d                   	pop    %ebp
  c3:	89 c8                	mov    %ecx,%eax
  c5:	c3                   	ret    
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi

000000d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	57                   	push   %edi
  d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  da:	8b 45 0c             	mov    0xc(%ebp),%eax
  dd:	89 d7                	mov    %edx,%edi
  df:	fc                   	cld    
  e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  e5:	89 d0                	mov    %edx,%eax
  e7:	c9                   	leave  
  e8:	c3                   	ret    
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strchr>:

char*
strchr(const char *s, char c)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  fa:	0f b6 10             	movzbl (%eax),%edx
  fd:	84 d2                	test   %dl,%dl
  ff:	75 12                	jne    113 <strchr+0x23>
 101:	eb 1d                	jmp    120 <strchr+0x30>
 103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 107:	90                   	nop
 108:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 10c:	83 c0 01             	add    $0x1,%eax
 10f:	84 d2                	test   %dl,%dl
 111:	74 0d                	je     120 <strchr+0x30>
    if(*s == c)
 113:	38 d1                	cmp    %dl,%cl
 115:	75 f1                	jne    108 <strchr+0x18>
      return (char*)s;
  return 0;
}
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 120:	31 c0                	xor    %eax,%eax
}
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    
 124:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 12f:	90                   	nop

00000130 <gets>:

char*
gets(char *buf, int max)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 135:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 138:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 139:	31 db                	xor    %ebx,%ebx
{
 13b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 13e:	eb 27                	jmp    167 <gets+0x37>
    cc = read(0, &c, 1);
 140:	83 ec 04             	sub    $0x4,%esp
 143:	6a 01                	push   $0x1
 145:	57                   	push   %edi
 146:	6a 00                	push   $0x0
 148:	e8 2e 01 00 00       	call   27b <read>
    if(cc < 1)
 14d:	83 c4 10             	add    $0x10,%esp
 150:	85 c0                	test   %eax,%eax
 152:	7e 1d                	jle    171 <gets+0x41>
      break;
    buf[i++] = c;
 154:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 158:	8b 55 08             	mov    0x8(%ebp),%edx
 15b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 15f:	3c 0a                	cmp    $0xa,%al
 161:	74 1d                	je     180 <gets+0x50>
 163:	3c 0d                	cmp    $0xd,%al
 165:	74 19                	je     180 <gets+0x50>
  for(i=0; i+1 < max; ){
 167:	89 de                	mov    %ebx,%esi
 169:	83 c3 01             	add    $0x1,%ebx
 16c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 16f:	7c cf                	jl     140 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 178:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17b:	5b                   	pop    %ebx
 17c:	5e                   	pop    %esi
 17d:	5f                   	pop    %edi
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    
  buf[i] = '\0';
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	89 de                	mov    %ebx,%esi
 185:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 189:	8d 65 f4             	lea    -0xc(%ebp),%esp
 18c:	5b                   	pop    %ebx
 18d:	5e                   	pop    %esi
 18e:	5f                   	pop    %edi
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    
 191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 198:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a5:	83 ec 08             	sub    $0x8,%esp
 1a8:	6a 00                	push   $0x0
 1aa:	ff 75 08             	push   0x8(%ebp)
 1ad:	e8 f1 00 00 00       	call   2a3 <open>
  if(fd < 0)
 1b2:	83 c4 10             	add    $0x10,%esp
 1b5:	85 c0                	test   %eax,%eax
 1b7:	78 27                	js     1e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1b9:	83 ec 08             	sub    $0x8,%esp
 1bc:	ff 75 0c             	push   0xc(%ebp)
 1bf:	89 c3                	mov    %eax,%ebx
 1c1:	50                   	push   %eax
 1c2:	e8 f4 00 00 00       	call   2bb <fstat>
  close(fd);
 1c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ca:	89 c6                	mov    %eax,%esi
  close(fd);
 1cc:	e8 ba 00 00 00       	call   28b <close>
  return r;
 1d1:	83 c4 10             	add    $0x10,%esp
}
 1d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1d7:	89 f0                	mov    %esi,%eax
 1d9:	5b                   	pop    %ebx
 1da:	5e                   	pop    %esi
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1e5:	eb ed                	jmp    1d4 <stat+0x34>
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <atoi>:

int
atoi(const char *s)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1f7:	0f be 02             	movsbl (%edx),%eax
 1fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 1fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 200:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 205:	77 1e                	ja     225 <atoi+0x35>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 210:	83 c2 01             	add    $0x1,%edx
 213:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 216:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 21a:	0f be 02             	movsbl (%edx),%eax
 21d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 220:	80 fb 09             	cmp    $0x9,%bl
 223:	76 eb                	jbe    210 <atoi+0x20>
  return n;
}
 225:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 228:	89 c8                	mov    %ecx,%eax
 22a:	c9                   	leave  
 22b:	c3                   	ret    
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 45 10             	mov    0x10(%ebp),%eax
 237:	8b 55 08             	mov    0x8(%ebp),%edx
 23a:	56                   	push   %esi
 23b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 23e:	85 c0                	test   %eax,%eax
 240:	7e 13                	jle    255 <memmove+0x25>
 242:	01 d0                	add    %edx,%eax
  dst = vdst;
 244:	89 d7                	mov    %edx,%edi
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 250:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 251:	39 f8                	cmp    %edi,%eax
 253:	75 fb                	jne    250 <memmove+0x20>
  return vdst;
}
 255:	5e                   	pop    %esi
 256:	89 d0                	mov    %edx,%eax
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    

0000025b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 25b:	b8 01 00 00 00       	mov    $0x1,%eax
 260:	cd 40                	int    $0x40
 262:	c3                   	ret    

00000263 <exit>:
SYSCALL(exit)
 263:	b8 02 00 00 00       	mov    $0x2,%eax
 268:	cd 40                	int    $0x40
 26a:	c3                   	ret    

0000026b <wait>:
SYSCALL(wait)
 26b:	b8 03 00 00 00       	mov    $0x3,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <pipe>:
SYSCALL(pipe)
 273:	b8 04 00 00 00       	mov    $0x4,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <read>:
SYSCALL(read)
 27b:	b8 05 00 00 00       	mov    $0x5,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <write>:
SYSCALL(write)
 283:	b8 10 00 00 00       	mov    $0x10,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <close>:
SYSCALL(close)
 28b:	b8 15 00 00 00       	mov    $0x15,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <kill>:
SYSCALL(kill)
 293:	b8 06 00 00 00       	mov    $0x6,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <exec>:
SYSCALL(exec)
 29b:	b8 07 00 00 00       	mov    $0x7,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <open>:
SYSCALL(open)
 2a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <mknod>:
SYSCALL(mknod)
 2ab:	b8 11 00 00 00       	mov    $0x11,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <unlink>:
SYSCALL(unlink)
 2b3:	b8 12 00 00 00       	mov    $0x12,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <fstat>:
SYSCALL(fstat)
 2bb:	b8 08 00 00 00       	mov    $0x8,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <link>:
SYSCALL(link)
 2c3:	b8 13 00 00 00       	mov    $0x13,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mkdir>:
SYSCALL(mkdir)
 2cb:	b8 14 00 00 00       	mov    $0x14,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <chdir>:
SYSCALL(chdir)
 2d3:	b8 09 00 00 00       	mov    $0x9,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <dup>:
SYSCALL(dup)
 2db:	b8 0a 00 00 00       	mov    $0xa,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <getpid>:
SYSCALL(getpid)
 2e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <sbrk>:
SYSCALL(sbrk)
 2eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <sleep>:
SYSCALL(sleep)
 2f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <uptime>:
SYSCALL(uptime)
 2fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <cps>:
SYSCALL(cps)
 303:	b8 16 00 00 00       	mov    $0x16,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <chpr>:
SYSCALL(chpr)
 30b:	b8 17 00 00 00       	mov    $0x17,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    
 313:	66 90                	xchg   %ax,%ax
 315:	66 90                	xchg   %ax,%ax
 317:	66 90                	xchg   %ax,%ax
 319:	66 90                	xchg   %ax,%ax
 31b:	66 90                	xchg   %ax,%ax
 31d:	66 90                	xchg   %ax,%ax
 31f:	90                   	nop

00000320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	83 ec 3c             	sub    $0x3c,%esp
 329:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 32c:	89 d1                	mov    %edx,%ecx
{
 32e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 331:	85 d2                	test   %edx,%edx
 333:	0f 89 7f 00 00 00    	jns    3b8 <printint+0x98>
 339:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 33d:	74 79                	je     3b8 <printint+0x98>
    neg = 1;
 33f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 346:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 348:	31 db                	xor    %ebx,%ebx
 34a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 350:	89 c8                	mov    %ecx,%eax
 352:	31 d2                	xor    %edx,%edx
 354:	89 cf                	mov    %ecx,%edi
 356:	f7 75 c4             	divl   -0x3c(%ebp)
 359:	0f b6 92 58 07 00 00 	movzbl 0x758(%edx),%edx
 360:	89 45 c0             	mov    %eax,-0x40(%ebp)
 363:	89 d8                	mov    %ebx,%eax
 365:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 368:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 36b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 36e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 371:	76 dd                	jbe    350 <printint+0x30>
  if(neg)
 373:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 376:	85 c9                	test   %ecx,%ecx
 378:	74 0c                	je     386 <printint+0x66>
    buf[i++] = '-';
 37a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 37f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 381:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 386:	8b 7d b8             	mov    -0x48(%ebp),%edi
 389:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 38d:	eb 07                	jmp    396 <printint+0x76>
 38f:	90                   	nop
    putc(fd, buf[i]);
 390:	0f b6 13             	movzbl (%ebx),%edx
 393:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 396:	83 ec 04             	sub    $0x4,%esp
 399:	88 55 d7             	mov    %dl,-0x29(%ebp)
 39c:	6a 01                	push   $0x1
 39e:	56                   	push   %esi
 39f:	57                   	push   %edi
 3a0:	e8 de fe ff ff       	call   283 <write>
  while(--i >= 0)
 3a5:	83 c4 10             	add    $0x10,%esp
 3a8:	39 de                	cmp    %ebx,%esi
 3aa:	75 e4                	jne    390 <printint+0x70>
}
 3ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3af:	5b                   	pop    %ebx
 3b0:	5e                   	pop    %esi
 3b1:	5f                   	pop    %edi
 3b2:	5d                   	pop    %ebp
 3b3:	c3                   	ret    
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3bf:	eb 87                	jmp    348 <printint+0x28>
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 3dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 3df:	0f b6 13             	movzbl (%ebx),%edx
 3e2:	84 d2                	test   %dl,%dl
 3e4:	74 6a                	je     450 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 3e6:	8d 45 10             	lea    0x10(%ebp),%eax
 3e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 3ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 3ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 3f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3f4:	eb 36                	jmp    42c <printf+0x5c>
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 403:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 408:	83 f8 25             	cmp    $0x25,%eax
 40b:	74 15                	je     422 <printf+0x52>
  write(fd, &c, 1);
 40d:	83 ec 04             	sub    $0x4,%esp
 410:	88 55 e7             	mov    %dl,-0x19(%ebp)
 413:	6a 01                	push   $0x1
 415:	57                   	push   %edi
 416:	56                   	push   %esi
 417:	e8 67 fe ff ff       	call   283 <write>
 41c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 41f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 422:	0f b6 13             	movzbl (%ebx),%edx
 425:	83 c3 01             	add    $0x1,%ebx
 428:	84 d2                	test   %dl,%dl
 42a:	74 24                	je     450 <printf+0x80>
    c = fmt[i] & 0xff;
 42c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 42f:	85 c9                	test   %ecx,%ecx
 431:	74 cd                	je     400 <printf+0x30>
      }
    } else if(state == '%'){
 433:	83 f9 25             	cmp    $0x25,%ecx
 436:	75 ea                	jne    422 <printf+0x52>
      if(c == 'd'){
 438:	83 f8 25             	cmp    $0x25,%eax
 43b:	0f 84 07 01 00 00    	je     548 <printf+0x178>
 441:	83 e8 63             	sub    $0x63,%eax
 444:	83 f8 15             	cmp    $0x15,%eax
 447:	77 17                	ja     460 <printf+0x90>
 449:	ff 24 85 00 07 00 00 	jmp    *0x700(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 450:	8d 65 f4             	lea    -0xc(%ebp),%esp
 453:	5b                   	pop    %ebx
 454:	5e                   	pop    %esi
 455:	5f                   	pop    %edi
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    
 458:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop
  write(fd, &c, 1);
 460:	83 ec 04             	sub    $0x4,%esp
 463:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 466:	6a 01                	push   $0x1
 468:	57                   	push   %edi
 469:	56                   	push   %esi
 46a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 46e:	e8 10 fe ff ff       	call   283 <write>
        putc(fd, c);
 473:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 477:	83 c4 0c             	add    $0xc,%esp
 47a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 47d:	6a 01                	push   $0x1
 47f:	57                   	push   %edi
 480:	56                   	push   %esi
 481:	e8 fd fd ff ff       	call   283 <write>
        putc(fd, c);
 486:	83 c4 10             	add    $0x10,%esp
      state = 0;
 489:	31 c9                	xor    %ecx,%ecx
 48b:	eb 95                	jmp    422 <printf+0x52>
 48d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 490:	83 ec 0c             	sub    $0xc,%esp
 493:	b9 10 00 00 00       	mov    $0x10,%ecx
 498:	6a 00                	push   $0x0
 49a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 49d:	8b 10                	mov    (%eax),%edx
 49f:	89 f0                	mov    %esi,%eax
 4a1:	e8 7a fe ff ff       	call   320 <printint>
        ap++;
 4a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ad:	31 c9                	xor    %ecx,%ecx
 4af:	e9 6e ff ff ff       	jmp    422 <printf+0x52>
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4bb:	8b 10                	mov    (%eax),%edx
        ap++;
 4bd:	83 c0 04             	add    $0x4,%eax
 4c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4c3:	85 d2                	test   %edx,%edx
 4c5:	0f 84 8d 00 00 00    	je     558 <printf+0x188>
        while(*s != 0){
 4cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 4ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 4d0:	84 c0                	test   %al,%al
 4d2:	0f 84 4a ff ff ff    	je     422 <printf+0x52>
 4d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 4db:	89 d3                	mov    %edx,%ebx
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 4e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 4e3:	83 c3 01             	add    $0x1,%ebx
 4e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4e9:	6a 01                	push   $0x1
 4eb:	57                   	push   %edi
 4ec:	56                   	push   %esi
 4ed:	e8 91 fd ff ff       	call   283 <write>
        while(*s != 0){
 4f2:	0f b6 03             	movzbl (%ebx),%eax
 4f5:	83 c4 10             	add    $0x10,%esp
 4f8:	84 c0                	test   %al,%al
 4fa:	75 e4                	jne    4e0 <printf+0x110>
      state = 0;
 4fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 4ff:	31 c9                	xor    %ecx,%ecx
 501:	e9 1c ff ff ff       	jmp    422 <printf+0x52>
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 0a 00 00 00       	mov    $0xa,%ecx
 518:	6a 01                	push   $0x1
 51a:	e9 7b ff ff ff       	jmp    49a <printf+0xca>
 51f:	90                   	nop
        putc(fd, *ap);
 520:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 523:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 526:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 528:	6a 01                	push   $0x1
 52a:	57                   	push   %edi
 52b:	56                   	push   %esi
        putc(fd, *ap);
 52c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 52f:	e8 4f fd ff ff       	call   283 <write>
        ap++;
 534:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 538:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53b:	31 c9                	xor    %ecx,%ecx
 53d:	e9 e0 fe ff ff       	jmp    422 <printf+0x52>
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 548:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 54b:	83 ec 04             	sub    $0x4,%esp
 54e:	e9 2a ff ff ff       	jmp    47d <printf+0xad>
 553:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 557:	90                   	nop
          s = "(null)";
 558:	ba f8 06 00 00       	mov    $0x6f8,%edx
        while(*s != 0){
 55d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 560:	b8 28 00 00 00       	mov    $0x28,%eax
 565:	89 d3                	mov    %edx,%ebx
 567:	e9 74 ff ff ff       	jmp    4e0 <printf+0x110>
 56c:	66 90                	xchg   %ax,%ax
 56e:	66 90                	xchg   %ax,%ax

00000570 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 570:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 571:	a1 f8 09 00 00       	mov    0x9f8,%eax
{
 576:	89 e5                	mov    %esp,%ebp
 578:	57                   	push   %edi
 579:	56                   	push   %esi
 57a:	53                   	push   %ebx
 57b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 57e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 588:	89 c2                	mov    %eax,%edx
 58a:	8b 00                	mov    (%eax),%eax
 58c:	39 ca                	cmp    %ecx,%edx
 58e:	73 30                	jae    5c0 <free+0x50>
 590:	39 c1                	cmp    %eax,%ecx
 592:	72 04                	jb     598 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 594:	39 c2                	cmp    %eax,%edx
 596:	72 f0                	jb     588 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 598:	8b 73 fc             	mov    -0x4(%ebx),%esi
 59b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 59e:	39 f8                	cmp    %edi,%eax
 5a0:	74 30                	je     5d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5a5:	8b 42 04             	mov    0x4(%edx),%eax
 5a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5ab:	39 f1                	cmp    %esi,%ecx
 5ad:	74 3a                	je     5e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5b1:	5b                   	pop    %ebx
  freep = p;
 5b2:	89 15 f8 09 00 00    	mov    %edx,0x9f8
}
 5b8:	5e                   	pop    %esi
 5b9:	5f                   	pop    %edi
 5ba:	5d                   	pop    %ebp
 5bb:	c3                   	ret    
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c0:	39 c2                	cmp    %eax,%edx
 5c2:	72 c4                	jb     588 <free+0x18>
 5c4:	39 c1                	cmp    %eax,%ecx
 5c6:	73 c0                	jae    588 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 5c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ce:	39 f8                	cmp    %edi,%eax
 5d0:	75 d0                	jne    5a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 5d2:	03 70 04             	add    0x4(%eax),%esi
 5d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5d8:	8b 02                	mov    (%edx),%eax
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 5df:	8b 42 04             	mov    0x4(%edx),%eax
 5e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5e5:	39 f1                	cmp    %esi,%ecx
 5e7:	75 c6                	jne    5af <free+0x3f>
    p->s.size += bp->s.size;
 5e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 5ec:	89 15 f8 09 00 00    	mov    %edx,0x9f8
    p->s.size += bp->s.size;
 5f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 5f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 5f8:	89 0a                	mov    %ecx,(%edx)
}
 5fa:	5b                   	pop    %ebx
 5fb:	5e                   	pop    %esi
 5fc:	5f                   	pop    %edi
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    
 5ff:	90                   	nop

00000600 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 609:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 60c:	8b 3d f8 09 00 00    	mov    0x9f8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 612:	8d 70 07             	lea    0x7(%eax),%esi
 615:	c1 ee 03             	shr    $0x3,%esi
 618:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 61b:	85 ff                	test   %edi,%edi
 61d:	0f 84 9d 00 00 00    	je     6c0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 623:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 625:	8b 4a 04             	mov    0x4(%edx),%ecx
 628:	39 f1                	cmp    %esi,%ecx
 62a:	73 6a                	jae    696 <malloc+0x96>
 62c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 631:	39 de                	cmp    %ebx,%esi
 633:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 636:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 63d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 640:	eb 17                	jmp    659 <malloc+0x59>
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 648:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 64a:	8b 48 04             	mov    0x4(%eax),%ecx
 64d:	39 f1                	cmp    %esi,%ecx
 64f:	73 4f                	jae    6a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 651:	8b 3d f8 09 00 00    	mov    0x9f8,%edi
 657:	89 c2                	mov    %eax,%edx
 659:	39 d7                	cmp    %edx,%edi
 65b:	75 eb                	jne    648 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 65d:	83 ec 0c             	sub    $0xc,%esp
 660:	ff 75 e4             	push   -0x1c(%ebp)
 663:	e8 83 fc ff ff       	call   2eb <sbrk>
  if(p == (char*)-1)
 668:	83 c4 10             	add    $0x10,%esp
 66b:	83 f8 ff             	cmp    $0xffffffff,%eax
 66e:	74 1c                	je     68c <malloc+0x8c>
  hp->s.size = nu;
 670:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 673:	83 ec 0c             	sub    $0xc,%esp
 676:	83 c0 08             	add    $0x8,%eax
 679:	50                   	push   %eax
 67a:	e8 f1 fe ff ff       	call   570 <free>
  return freep;
 67f:	8b 15 f8 09 00 00    	mov    0x9f8,%edx
      if((p = morecore(nunits)) == 0)
 685:	83 c4 10             	add    $0x10,%esp
 688:	85 d2                	test   %edx,%edx
 68a:	75 bc                	jne    648 <malloc+0x48>
        return 0;
  }
}
 68c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 68f:	31 c0                	xor    %eax,%eax
}
 691:	5b                   	pop    %ebx
 692:	5e                   	pop    %esi
 693:	5f                   	pop    %edi
 694:	5d                   	pop    %ebp
 695:	c3                   	ret    
    if(p->s.size >= nunits){
 696:	89 d0                	mov    %edx,%eax
 698:	89 fa                	mov    %edi,%edx
 69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6a0:	39 ce                	cmp    %ecx,%esi
 6a2:	74 4c                	je     6f0 <malloc+0xf0>
        p->s.size -= nunits;
 6a4:	29 f1                	sub    %esi,%ecx
 6a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6ac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6af:	89 15 f8 09 00 00    	mov    %edx,0x9f8
}
 6b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6b8:	83 c0 08             	add    $0x8,%eax
}
 6bb:	5b                   	pop    %ebx
 6bc:	5e                   	pop    %esi
 6bd:	5f                   	pop    %edi
 6be:	5d                   	pop    %ebp
 6bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 6c0:	c7 05 f8 09 00 00 fc 	movl   $0x9fc,0x9f8
 6c7:	09 00 00 
    base.s.size = 0;
 6ca:	bf fc 09 00 00       	mov    $0x9fc,%edi
    base.s.ptr = freep = prevp = &base;
 6cf:	c7 05 fc 09 00 00 fc 	movl   $0x9fc,0x9fc
 6d6:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 6db:	c7 05 00 0a 00 00 00 	movl   $0x0,0xa00
 6e2:	00 00 00 
    if(p->s.size >= nunits){
 6e5:	e9 42 ff ff ff       	jmp    62c <malloc+0x2c>
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 6f0:	8b 08                	mov    (%eax),%ecx
 6f2:	89 0a                	mov    %ecx,(%edx)
 6f4:	eb b9                	jmp    6af <malloc+0xaf>
