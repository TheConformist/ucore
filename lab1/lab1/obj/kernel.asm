
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

void
kern_init(void){
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 80 0d 11 00       	mov    $0x110d80,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 fa 10 00       	push   $0x10fa16
  10001f:	e8 84 2e 00 00       	call   102ea8 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 09 16 00 00       	call   101635 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 80 36 10 00 	movl   $0x103680,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 9c 36 10 00       	push   $0x10369c
  10003e:	e8 32 02 00 00       	call   100275 <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 e6 08 00 00       	call   100931 <print_kerninfo>

    grade_backtrace();
  10004b:	e8 85 00 00 00       	call   1000d5 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 f1 2a 00 00       	call   102b46 <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 34 17 00 00       	call   10178e <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 d6 18 00 00       	call   101935 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 56 0d 00 00       	call   100dba <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 74 18 00 00       	call   1018dd <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100069:	e8 6c 01 00 00       	call   1001da <lab1_switch_test>

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	83 ec 04             	sub    $0x4,%esp
  10007d:	6a 00                	push   $0x0
  10007f:	6a 00                	push   $0x0
  100081:	6a 00                	push   $0x0
  100083:	e8 1c 0d 00 00       	call   100da4 <mon_backtrace>
  100088:	83 c4 10             	add    $0x10,%esp
}
  10008b:	90                   	nop
  10008c:	c9                   	leave  
  10008d:	c3                   	ret    

0010008e <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10008e:	f3 0f 1e fb          	endbr32 
  100092:	55                   	push   %ebp
  100093:	89 e5                	mov    %esp,%ebp
  100095:	53                   	push   %ebx
  100096:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100099:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10009c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10009f:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a5:	51                   	push   %ecx
  1000a6:	52                   	push   %edx
  1000a7:	53                   	push   %ebx
  1000a8:	50                   	push   %eax
  1000a9:	e8 c2 ff ff ff       	call   100070 <grade_backtrace2>
  1000ae:	83 c4 10             	add    $0x10,%esp
}
  1000b1:	90                   	nop
  1000b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000b5:	c9                   	leave  
  1000b6:	c3                   	ret    

001000b7 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000b7:	f3 0f 1e fb          	endbr32 
  1000bb:	55                   	push   %ebp
  1000bc:	89 e5                	mov    %esp,%ebp
  1000be:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000c1:	83 ec 08             	sub    $0x8,%esp
  1000c4:	ff 75 10             	pushl  0x10(%ebp)
  1000c7:	ff 75 08             	pushl  0x8(%ebp)
  1000ca:	e8 bf ff ff ff       	call   10008e <grade_backtrace1>
  1000cf:	83 c4 10             	add    $0x10,%esp
}
  1000d2:	90                   	nop
  1000d3:	c9                   	leave  
  1000d4:	c3                   	ret    

001000d5 <grade_backtrace>:

void
grade_backtrace(void) {
  1000d5:	f3 0f 1e fb          	endbr32 
  1000d9:	55                   	push   %ebp
  1000da:	89 e5                	mov    %esp,%ebp
  1000dc:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000df:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e4:	83 ec 04             	sub    $0x4,%esp
  1000e7:	68 00 00 ff ff       	push   $0xffff0000
  1000ec:	50                   	push   %eax
  1000ed:	6a 00                	push   $0x0
  1000ef:	e8 c3 ff ff ff       	call   1000b7 <grade_backtrace0>
  1000f4:	83 c4 10             	add    $0x10,%esp
}
  1000f7:	90                   	nop
  1000f8:	c9                   	leave  
  1000f9:	c3                   	ret    

001000fa <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000fa:	f3 0f 1e fb          	endbr32 
  1000fe:	55                   	push   %ebp
  1000ff:	89 e5                	mov    %esp,%ebp
  100101:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100104:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100107:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010a:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010d:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100110:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100114:	0f b7 c0             	movzwl %ax,%eax
  100117:	83 e0 03             	and    $0x3,%eax
  10011a:	89 c2                	mov    %eax,%edx
  10011c:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100121:	83 ec 04             	sub    $0x4,%esp
  100124:	52                   	push   %edx
  100125:	50                   	push   %eax
  100126:	68 a1 36 10 00       	push   $0x1036a1
  10012b:	e8 45 01 00 00       	call   100275 <cprintf>
  100130:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  100133:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100137:	0f b7 d0             	movzwl %ax,%edx
  10013a:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10013f:	83 ec 04             	sub    $0x4,%esp
  100142:	52                   	push   %edx
  100143:	50                   	push   %eax
  100144:	68 af 36 10 00       	push   $0x1036af
  100149:	e8 27 01 00 00       	call   100275 <cprintf>
  10014e:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100151:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100155:	0f b7 d0             	movzwl %ax,%edx
  100158:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10015d:	83 ec 04             	sub    $0x4,%esp
  100160:	52                   	push   %edx
  100161:	50                   	push   %eax
  100162:	68 bd 36 10 00       	push   $0x1036bd
  100167:	e8 09 01 00 00       	call   100275 <cprintf>
  10016c:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  10016f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100173:	0f b7 d0             	movzwl %ax,%edx
  100176:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10017b:	83 ec 04             	sub    $0x4,%esp
  10017e:	52                   	push   %edx
  10017f:	50                   	push   %eax
  100180:	68 cb 36 10 00       	push   $0x1036cb
  100185:	e8 eb 00 00 00       	call   100275 <cprintf>
  10018a:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  10018d:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100191:	0f b7 d0             	movzwl %ax,%edx
  100194:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100199:	83 ec 04             	sub    $0x4,%esp
  10019c:	52                   	push   %edx
  10019d:	50                   	push   %eax
  10019e:	68 d9 36 10 00       	push   $0x1036d9
  1001a3:	e8 cd 00 00 00       	call   100275 <cprintf>
  1001a8:	83 c4 10             	add    $0x10,%esp
    round ++;
  1001ab:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b0:	83 c0 01             	add    $0x1,%eax
  1001b3:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001b8:	90                   	nop
  1001b9:	c9                   	leave  
  1001ba:	c3                   	ret    

001001bb <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001bb:	f3 0f 1e fb          	endbr32 
  1001bf:	55                   	push   %ebp
  1001c0:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
	asm volatile (
  1001c2:	83 ec 08             	sub    $0x8,%esp
  1001c5:	cd 78                	int    $0x78
  1001c7:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001c9:	90                   	nop
  1001ca:	5d                   	pop    %ebp
  1001cb:	c3                   	ret    

001001cc <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cc:	f3 0f 1e fb          	endbr32 
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
	asm volatile (
  1001d3:	cd 79                	int    $0x79
  1001d5:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001d7:	90                   	nop
  1001d8:	5d                   	pop    %ebp
  1001d9:	c3                   	ret    

001001da <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001da:	f3 0f 1e fb          	endbr32 
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001e4:	e8 11 ff ff ff       	call   1000fa <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e9:	83 ec 0c             	sub    $0xc,%esp
  1001ec:	68 e8 36 10 00       	push   $0x1036e8
  1001f1:	e8 7f 00 00 00       	call   100275 <cprintf>
  1001f6:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001f9:	e8 bd ff ff ff       	call   1001bb <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fe:	e8 f7 fe ff ff       	call   1000fa <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  100203:	83 ec 0c             	sub    $0xc,%esp
  100206:	68 08 37 10 00       	push   $0x103708
  10020b:	e8 65 00 00 00       	call   100275 <cprintf>
  100210:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  100213:	e8 b4 ff ff ff       	call   1001cc <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100218:	e8 dd fe ff ff       	call   1000fa <lab1_print_cur_status>
}
  10021d:	90                   	nop
  10021e:	c9                   	leave  
  10021f:	c3                   	ret    

00100220 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100220:	f3 0f 1e fb          	endbr32 
  100224:	55                   	push   %ebp
  100225:	89 e5                	mov    %esp,%ebp
  100227:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  10022a:	83 ec 0c             	sub    $0xc,%esp
  10022d:	ff 75 08             	pushl  0x8(%ebp)
  100230:	e8 35 14 00 00       	call   10166a <cons_putc>
  100235:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  100238:	8b 45 0c             	mov    0xc(%ebp),%eax
  10023b:	8b 00                	mov    (%eax),%eax
  10023d:	8d 50 01             	lea    0x1(%eax),%edx
  100240:	8b 45 0c             	mov    0xc(%ebp),%eax
  100243:	89 10                	mov    %edx,(%eax)
}
  100245:	90                   	nop
  100246:	c9                   	leave  
  100247:	c3                   	ret    

00100248 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100248:	f3 0f 1e fb          	endbr32 
  10024c:	55                   	push   %ebp
  10024d:	89 e5                	mov    %esp,%ebp
  10024f:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100252:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100259:	ff 75 0c             	pushl  0xc(%ebp)
  10025c:	ff 75 08             	pushl  0x8(%ebp)
  10025f:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100262:	50                   	push   %eax
  100263:	68 20 02 10 00       	push   $0x100220
  100268:	e8 8a 2f 00 00       	call   1031f7 <vprintfmt>
  10026d:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100270:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100273:	c9                   	leave  
  100274:	c3                   	ret    

00100275 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100275:	f3 0f 1e fb          	endbr32 
  100279:	55                   	push   %ebp
  10027a:	89 e5                	mov    %esp,%ebp
  10027c:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10027f:	8d 45 0c             	lea    0xc(%ebp),%eax
  100282:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100285:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100288:	83 ec 08             	sub    $0x8,%esp
  10028b:	50                   	push   %eax
  10028c:	ff 75 08             	pushl  0x8(%ebp)
  10028f:	e8 b4 ff ff ff       	call   100248 <vcprintf>
  100294:	83 c4 10             	add    $0x10,%esp
  100297:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10029a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10029d:	c9                   	leave  
  10029e:	c3                   	ret    

0010029f <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10029f:	f3 0f 1e fb          	endbr32 
  1002a3:	55                   	push   %ebp
  1002a4:	89 e5                	mov    %esp,%ebp
  1002a6:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1002a9:	83 ec 0c             	sub    $0xc,%esp
  1002ac:	ff 75 08             	pushl  0x8(%ebp)
  1002af:	e8 b6 13 00 00       	call   10166a <cons_putc>
  1002b4:	83 c4 10             	add    $0x10,%esp
}
  1002b7:	90                   	nop
  1002b8:	c9                   	leave  
  1002b9:	c3                   	ret    

001002ba <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002ba:	f3 0f 1e fb          	endbr32 
  1002be:	55                   	push   %ebp
  1002bf:	89 e5                	mov    %esp,%ebp
  1002c1:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  1002c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002cb:	eb 14                	jmp    1002e1 <cputs+0x27>
        cputch(c, &cnt);
  1002cd:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002d1:	83 ec 08             	sub    $0x8,%esp
  1002d4:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002d7:	52                   	push   %edx
  1002d8:	50                   	push   %eax
  1002d9:	e8 42 ff ff ff       	call   100220 <cputch>
  1002de:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  1002e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1002e4:	8d 50 01             	lea    0x1(%eax),%edx
  1002e7:	89 55 08             	mov    %edx,0x8(%ebp)
  1002ea:	0f b6 00             	movzbl (%eax),%eax
  1002ed:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002f0:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002f4:	75 d7                	jne    1002cd <cputs+0x13>
    }
    cputch('\n', &cnt);
  1002f6:	83 ec 08             	sub    $0x8,%esp
  1002f9:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002fc:	50                   	push   %eax
  1002fd:	6a 0a                	push   $0xa
  1002ff:	e8 1c ff ff ff       	call   100220 <cputch>
  100304:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100307:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  10030a:	c9                   	leave  
  10030b:	c3                   	ret    

0010030c <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10030c:	f3 0f 1e fb          	endbr32 
  100310:	55                   	push   %ebp
  100311:	89 e5                	mov    %esp,%ebp
  100313:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100316:	90                   	nop
  100317:	e8 82 13 00 00       	call   10169e <cons_getc>
  10031c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10031f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100323:	74 f2                	je     100317 <getchar+0xb>
        /* do nothing */;
    return c;
  100325:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100328:	c9                   	leave  
  100329:	c3                   	ret    

0010032a <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10032a:	f3 0f 1e fb          	endbr32 
  10032e:	55                   	push   %ebp
  10032f:	89 e5                	mov    %esp,%ebp
  100331:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  100334:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100338:	74 13                	je     10034d <readline+0x23>
        cprintf("%s", prompt);
  10033a:	83 ec 08             	sub    $0x8,%esp
  10033d:	ff 75 08             	pushl  0x8(%ebp)
  100340:	68 27 37 10 00       	push   $0x103727
  100345:	e8 2b ff ff ff       	call   100275 <cprintf>
  10034a:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  10034d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100354:	e8 b3 ff ff ff       	call   10030c <getchar>
  100359:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10035c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100360:	79 0a                	jns    10036c <readline+0x42>
            return NULL;
  100362:	b8 00 00 00 00       	mov    $0x0,%eax
  100367:	e9 82 00 00 00       	jmp    1003ee <readline+0xc4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10036c:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100370:	7e 2b                	jle    10039d <readline+0x73>
  100372:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100379:	7f 22                	jg     10039d <readline+0x73>
            cputchar(c);
  10037b:	83 ec 0c             	sub    $0xc,%esp
  10037e:	ff 75 f0             	pushl  -0x10(%ebp)
  100381:	e8 19 ff ff ff       	call   10029f <cputchar>
  100386:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100389:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10038c:	8d 50 01             	lea    0x1(%eax),%edx
  10038f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100392:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100395:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  10039b:	eb 4c                	jmp    1003e9 <readline+0xbf>
        }
        else if (c == '\b' && i > 0) {
  10039d:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a1:	75 1a                	jne    1003bd <readline+0x93>
  1003a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003a7:	7e 14                	jle    1003bd <readline+0x93>
            cputchar(c);
  1003a9:	83 ec 0c             	sub    $0xc,%esp
  1003ac:	ff 75 f0             	pushl  -0x10(%ebp)
  1003af:	e8 eb fe ff ff       	call   10029f <cputchar>
  1003b4:	83 c4 10             	add    $0x10,%esp
            i --;
  1003b7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1003bb:	eb 2c                	jmp    1003e9 <readline+0xbf>
        }
        else if (c == '\n' || c == '\r') {
  1003bd:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c1:	74 06                	je     1003c9 <readline+0x9f>
  1003c3:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003c7:	75 8b                	jne    100354 <readline+0x2a>
            cputchar(c);
  1003c9:	83 ec 0c             	sub    $0xc,%esp
  1003cc:	ff 75 f0             	pushl  -0x10(%ebp)
  1003cf:	e8 cb fe ff ff       	call   10029f <cputchar>
  1003d4:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xc4>
        c = getchar();
  1003e9:	e9 66 ff ff ff       	jmp    100354 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5f                	jne    100462 <__panic+0x72>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	83 ec 04             	sub    $0x4,%esp
  100416:	ff 75 0c             	pushl  0xc(%ebp)
  100419:	ff 75 08             	pushl  0x8(%ebp)
  10041c:	68 2a 37 10 00       	push   $0x10372a
  100421:	e8 4f fe ff ff       	call   100275 <cprintf>
  100426:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100429:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10042c:	83 ec 08             	sub    $0x8,%esp
  10042f:	50                   	push   %eax
  100430:	ff 75 10             	pushl  0x10(%ebp)
  100433:	e8 10 fe ff ff       	call   100248 <vcprintf>
  100438:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  10043b:	83 ec 0c             	sub    $0xc,%esp
  10043e:	68 46 37 10 00       	push   $0x103746
  100443:	e8 2d fe ff ff       	call   100275 <cprintf>
  100448:	83 c4 10             	add    $0x10,%esp
    
    cprintf("stack trackback:\n");
  10044b:	83 ec 0c             	sub    $0xc,%esp
  10044e:	68 48 37 10 00       	push   $0x103748
  100453:	e8 1d fe ff ff       	call   100275 <cprintf>
  100458:	83 c4 10             	add    $0x10,%esp
    print_stackframe();
  10045b:	e8 25 06 00 00       	call   100a85 <print_stackframe>
  100460:	eb 01                	jmp    100463 <__panic+0x73>
        goto panic_dead;
  100462:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100463:	e8 81 14 00 00       	call   1018e9 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100468:	83 ec 0c             	sub    $0xc,%esp
  10046b:	6a 00                	push   $0x0
  10046d:	e8 4c 08 00 00       	call   100cbe <kmonitor>
  100472:	83 c4 10             	add    $0x10,%esp
  100475:	eb f1                	jmp    100468 <__panic+0x78>

00100477 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100477:	f3 0f 1e fb          	endbr32 
  10047b:	55                   	push   %ebp
  10047c:	89 e5                	mov    %esp,%ebp
  10047e:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  100481:	8d 45 14             	lea    0x14(%ebp),%eax
  100484:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100487:	83 ec 04             	sub    $0x4,%esp
  10048a:	ff 75 0c             	pushl  0xc(%ebp)
  10048d:	ff 75 08             	pushl  0x8(%ebp)
  100490:	68 5a 37 10 00       	push   $0x10375a
  100495:	e8 db fd ff ff       	call   100275 <cprintf>
  10049a:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  10049d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004a0:	83 ec 08             	sub    $0x8,%esp
  1004a3:	50                   	push   %eax
  1004a4:	ff 75 10             	pushl  0x10(%ebp)
  1004a7:	e8 9c fd ff ff       	call   100248 <vcprintf>
  1004ac:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1004af:	83 ec 0c             	sub    $0xc,%esp
  1004b2:	68 46 37 10 00       	push   $0x103746
  1004b7:	e8 b9 fd ff ff       	call   100275 <cprintf>
  1004bc:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  1004bf:	90                   	nop
  1004c0:	c9                   	leave  
  1004c1:	c3                   	ret    

001004c2 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004c2:	f3 0f 1e fb          	endbr32 
  1004c6:	55                   	push   %ebp
  1004c7:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c9:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004ce:	5d                   	pop    %ebp
  1004cf:	c3                   	ret    

001004d0 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004d0:	f3 0f 1e fb          	endbr32 
  1004d4:	55                   	push   %ebp
  1004d5:	89 e5                	mov    %esp,%ebp
  1004d7:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004dd:	8b 00                	mov    (%eax),%eax
  1004df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004e2:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e5:	8b 00                	mov    (%eax),%eax
  1004e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004f1:	e9 d2 00 00 00       	jmp    1005c8 <stab_binsearch+0xf8>
        int true_m = (l + r) / 2, m = true_m;
  1004f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004fc:	01 d0                	add    %edx,%eax
  1004fe:	89 c2                	mov    %eax,%edx
  100500:	c1 ea 1f             	shr    $0x1f,%edx
  100503:	01 d0                	add    %edx,%eax
  100505:	d1 f8                	sar    %eax
  100507:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10050a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10050d:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100510:	eb 04                	jmp    100516 <stab_binsearch+0x46>
            m --;
  100512:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100516:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100519:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10051c:	7c 1f                	jl     10053d <stab_binsearch+0x6d>
  10051e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100521:	89 d0                	mov    %edx,%eax
  100523:	01 c0                	add    %eax,%eax
  100525:	01 d0                	add    %edx,%eax
  100527:	c1 e0 02             	shl    $0x2,%eax
  10052a:	89 c2                	mov    %eax,%edx
  10052c:	8b 45 08             	mov    0x8(%ebp),%eax
  10052f:	01 d0                	add    %edx,%eax
  100531:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100535:	0f b6 c0             	movzbl %al,%eax
  100538:	39 45 14             	cmp    %eax,0x14(%ebp)
  10053b:	75 d5                	jne    100512 <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  10053d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100540:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100543:	7d 0b                	jge    100550 <stab_binsearch+0x80>
            l = true_m + 1;
  100545:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100548:	83 c0 01             	add    $0x1,%eax
  10054b:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10054e:	eb 78                	jmp    1005c8 <stab_binsearch+0xf8>
        }

        // actual binary search
        any_matches = 1;
  100550:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100557:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10055a:	89 d0                	mov    %edx,%eax
  10055c:	01 c0                	add    %eax,%eax
  10055e:	01 d0                	add    %edx,%eax
  100560:	c1 e0 02             	shl    $0x2,%eax
  100563:	89 c2                	mov    %eax,%edx
  100565:	8b 45 08             	mov    0x8(%ebp),%eax
  100568:	01 d0                	add    %edx,%eax
  10056a:	8b 40 08             	mov    0x8(%eax),%eax
  10056d:	39 45 18             	cmp    %eax,0x18(%ebp)
  100570:	76 13                	jbe    100585 <stab_binsearch+0xb5>
            *region_left = m;
  100572:	8b 45 0c             	mov    0xc(%ebp),%eax
  100575:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100578:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10057a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10057d:	83 c0 01             	add    $0x1,%eax
  100580:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100583:	eb 43                	jmp    1005c8 <stab_binsearch+0xf8>
        } else if (stabs[m].n_value > addr) {
  100585:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100588:	89 d0                	mov    %edx,%eax
  10058a:	01 c0                	add    %eax,%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	c1 e0 02             	shl    $0x2,%eax
  100591:	89 c2                	mov    %eax,%edx
  100593:	8b 45 08             	mov    0x8(%ebp),%eax
  100596:	01 d0                	add    %edx,%eax
  100598:	8b 40 08             	mov    0x8(%eax),%eax
  10059b:	39 45 18             	cmp    %eax,0x18(%ebp)
  10059e:	73 16                	jae    1005b6 <stab_binsearch+0xe6>
            *region_right = m - 1;
  1005a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005a6:	8b 45 10             	mov    0x10(%ebp),%eax
  1005a9:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005ae:	83 e8 01             	sub    $0x1,%eax
  1005b1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005b4:	eb 12                	jmp    1005c8 <stab_binsearch+0xf8>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005bc:	89 10                	mov    %edx,(%eax)
            l = m;
  1005be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005c4:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  1005c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005cb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005ce:	0f 8e 22 ff ff ff    	jle    1004f6 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005d8:	75 0f                	jne    1005e9 <stab_binsearch+0x119>
        *region_right = *region_left - 1;
  1005da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005dd:	8b 00                	mov    (%eax),%eax
  1005df:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005e2:	8b 45 10             	mov    0x10(%ebp),%eax
  1005e5:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005e7:	eb 3f                	jmp    100628 <stab_binsearch+0x158>
        l = *region_right;
  1005e9:	8b 45 10             	mov    0x10(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005f1:	eb 04                	jmp    1005f7 <stab_binsearch+0x127>
  1005f3:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1005f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fa:	8b 00                	mov    (%eax),%eax
  1005fc:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005ff:	7e 1f                	jle    100620 <stab_binsearch+0x150>
  100601:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100604:	89 d0                	mov    %edx,%eax
  100606:	01 c0                	add    %eax,%eax
  100608:	01 d0                	add    %edx,%eax
  10060a:	c1 e0 02             	shl    $0x2,%eax
  10060d:	89 c2                	mov    %eax,%edx
  10060f:	8b 45 08             	mov    0x8(%ebp),%eax
  100612:	01 d0                	add    %edx,%eax
  100614:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100618:	0f b6 c0             	movzbl %al,%eax
  10061b:	39 45 14             	cmp    %eax,0x14(%ebp)
  10061e:	75 d3                	jne    1005f3 <stab_binsearch+0x123>
        *region_left = l;
  100620:	8b 45 0c             	mov    0xc(%ebp),%eax
  100623:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100626:	89 10                	mov    %edx,(%eax)
}
  100628:	90                   	nop
  100629:	c9                   	leave  
  10062a:	c3                   	ret    

0010062b <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10062b:	f3 0f 1e fb          	endbr32 
  10062f:	55                   	push   %ebp
  100630:	89 e5                	mov    %esp,%ebp
  100632:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100635:	8b 45 0c             	mov    0xc(%ebp),%eax
  100638:	c7 00 78 37 10 00    	movl   $0x103778,(%eax)
    info->eip_line = 0;
  10063e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100641:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100648:	8b 45 0c             	mov    0xc(%ebp),%eax
  10064b:	c7 40 08 78 37 10 00 	movl   $0x103778,0x8(%eax)
    info->eip_fn_namelen = 9;
  100652:	8b 45 0c             	mov    0xc(%ebp),%eax
  100655:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	8b 55 08             	mov    0x8(%ebp),%edx
  100662:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100665:	8b 45 0c             	mov    0xc(%ebp),%eax
  100668:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10066f:	c7 45 f4 ac 3f 10 00 	movl   $0x103fac,-0xc(%ebp)
    stab_end = __STAB_END__;
  100676:	c7 45 f0 cc cd 10 00 	movl   $0x10cdcc,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10067d:	c7 45 ec cd cd 10 00 	movl   $0x10cdcd,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100684:	c7 45 e8 db ee 10 00 	movl   $0x10eedb,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10068b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10068e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100691:	76 0d                	jbe    1006a0 <debuginfo_eip+0x75>
  100693:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100696:	83 e8 01             	sub    $0x1,%eax
  100699:	0f b6 00             	movzbl (%eax),%eax
  10069c:	84 c0                	test   %al,%al
  10069e:	74 0a                	je     1006aa <debuginfo_eip+0x7f>
        return -1;
  1006a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006a5:	e9 85 02 00 00       	jmp    10092f <debuginfo_eip+0x304>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  1006aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006b4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006b7:	c1 f8 02             	sar    $0x2,%eax
  1006ba:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006c0:	83 e8 01             	sub    $0x1,%eax
  1006c3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006c6:	ff 75 08             	pushl  0x8(%ebp)
  1006c9:	6a 64                	push   $0x64
  1006cb:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006ce:	50                   	push   %eax
  1006cf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006d2:	50                   	push   %eax
  1006d3:	ff 75 f4             	pushl  -0xc(%ebp)
  1006d6:	e8 f5 fd ff ff       	call   1004d0 <stab_binsearch>
  1006db:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  1006de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006e1:	85 c0                	test   %eax,%eax
  1006e3:	75 0a                	jne    1006ef <debuginfo_eip+0xc4>
        return -1;
  1006e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006ea:	e9 40 02 00 00       	jmp    10092f <debuginfo_eip+0x304>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f2:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f8:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006fb:	ff 75 08             	pushl  0x8(%ebp)
  1006fe:	6a 24                	push   $0x24
  100700:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100703:	50                   	push   %eax
  100704:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100707:	50                   	push   %eax
  100708:	ff 75 f4             	pushl  -0xc(%ebp)
  10070b:	e8 c0 fd ff ff       	call   1004d0 <stab_binsearch>
  100710:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  100713:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100716:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100719:	39 c2                	cmp    %eax,%edx
  10071b:	7f 78                	jg     100795 <debuginfo_eip+0x16a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10071d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100720:	89 c2                	mov    %eax,%edx
  100722:	89 d0                	mov    %edx,%eax
  100724:	01 c0                	add    %eax,%eax
  100726:	01 d0                	add    %edx,%eax
  100728:	c1 e0 02             	shl    $0x2,%eax
  10072b:	89 c2                	mov    %eax,%edx
  10072d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100730:	01 d0                	add    %edx,%eax
  100732:	8b 10                	mov    (%eax),%edx
  100734:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100737:	2b 45 ec             	sub    -0x14(%ebp),%eax
  10073a:	39 c2                	cmp    %eax,%edx
  10073c:	73 22                	jae    100760 <debuginfo_eip+0x135>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10073e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100741:	89 c2                	mov    %eax,%edx
  100743:	89 d0                	mov    %edx,%eax
  100745:	01 c0                	add    %eax,%eax
  100747:	01 d0                	add    %edx,%eax
  100749:	c1 e0 02             	shl    $0x2,%eax
  10074c:	89 c2                	mov    %eax,%edx
  10074e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100751:	01 d0                	add    %edx,%eax
  100753:	8b 10                	mov    (%eax),%edx
  100755:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100758:	01 c2                	add    %eax,%edx
  10075a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10075d:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100760:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100763:	89 c2                	mov    %eax,%edx
  100765:	89 d0                	mov    %edx,%eax
  100767:	01 c0                	add    %eax,%eax
  100769:	01 d0                	add    %edx,%eax
  10076b:	c1 e0 02             	shl    $0x2,%eax
  10076e:	89 c2                	mov    %eax,%edx
  100770:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100773:	01 d0                	add    %edx,%eax
  100775:	8b 50 08             	mov    0x8(%eax),%edx
  100778:	8b 45 0c             	mov    0xc(%ebp),%eax
  10077b:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10077e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100781:	8b 40 10             	mov    0x10(%eax),%eax
  100784:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100787:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10078a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10078d:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100790:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100793:	eb 15                	jmp    1007aa <debuginfo_eip+0x17f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100795:	8b 45 0c             	mov    0xc(%ebp),%eax
  100798:	8b 55 08             	mov    0x8(%ebp),%edx
  10079b:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007a7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ad:	8b 40 08             	mov    0x8(%eax),%eax
  1007b0:	83 ec 08             	sub    $0x8,%esp
  1007b3:	6a 3a                	push   $0x3a
  1007b5:	50                   	push   %eax
  1007b6:	e8 59 25 00 00       	call   102d14 <strfind>
  1007bb:	83 c4 10             	add    $0x10,%esp
  1007be:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007c1:	8b 52 08             	mov    0x8(%edx),%edx
  1007c4:	29 d0                	sub    %edx,%eax
  1007c6:	89 c2                	mov    %eax,%edx
  1007c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007cb:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007ce:	83 ec 0c             	sub    $0xc,%esp
  1007d1:	ff 75 08             	pushl  0x8(%ebp)
  1007d4:	6a 44                	push   $0x44
  1007d6:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007d9:	50                   	push   %eax
  1007da:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007dd:	50                   	push   %eax
  1007de:	ff 75 f4             	pushl  -0xc(%ebp)
  1007e1:	e8 ea fc ff ff       	call   1004d0 <stab_binsearch>
  1007e6:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  1007e9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007ec:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007ef:	39 c2                	cmp    %eax,%edx
  1007f1:	7f 24                	jg     100817 <debuginfo_eip+0x1ec>
        info->eip_line = stabs[rline].n_desc;
  1007f3:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007f6:	89 c2                	mov    %eax,%edx
  1007f8:	89 d0                	mov    %edx,%eax
  1007fa:	01 c0                	add    %eax,%eax
  1007fc:	01 d0                	add    %edx,%eax
  1007fe:	c1 e0 02             	shl    $0x2,%eax
  100801:	89 c2                	mov    %eax,%edx
  100803:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100806:	01 d0                	add    %edx,%eax
  100808:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10080c:	0f b7 d0             	movzwl %ax,%edx
  10080f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100812:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100815:	eb 13                	jmp    10082a <debuginfo_eip+0x1ff>
        return -1;
  100817:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10081c:	e9 0e 01 00 00       	jmp    10092f <debuginfo_eip+0x304>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100821:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100824:	83 e8 01             	sub    $0x1,%eax
  100827:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  10082a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10082d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100830:	39 c2                	cmp    %eax,%edx
  100832:	7c 56                	jl     10088a <debuginfo_eip+0x25f>
           && stabs[lline].n_type != N_SOL
  100834:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100837:	89 c2                	mov    %eax,%edx
  100839:	89 d0                	mov    %edx,%eax
  10083b:	01 c0                	add    %eax,%eax
  10083d:	01 d0                	add    %edx,%eax
  10083f:	c1 e0 02             	shl    $0x2,%eax
  100842:	89 c2                	mov    %eax,%edx
  100844:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100847:	01 d0                	add    %edx,%eax
  100849:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10084d:	3c 84                	cmp    $0x84,%al
  10084f:	74 39                	je     10088a <debuginfo_eip+0x25f>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100851:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100854:	89 c2                	mov    %eax,%edx
  100856:	89 d0                	mov    %edx,%eax
  100858:	01 c0                	add    %eax,%eax
  10085a:	01 d0                	add    %edx,%eax
  10085c:	c1 e0 02             	shl    $0x2,%eax
  10085f:	89 c2                	mov    %eax,%edx
  100861:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100864:	01 d0                	add    %edx,%eax
  100866:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10086a:	3c 64                	cmp    $0x64,%al
  10086c:	75 b3                	jne    100821 <debuginfo_eip+0x1f6>
  10086e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100871:	89 c2                	mov    %eax,%edx
  100873:	89 d0                	mov    %edx,%eax
  100875:	01 c0                	add    %eax,%eax
  100877:	01 d0                	add    %edx,%eax
  100879:	c1 e0 02             	shl    $0x2,%eax
  10087c:	89 c2                	mov    %eax,%edx
  10087e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100881:	01 d0                	add    %edx,%eax
  100883:	8b 40 08             	mov    0x8(%eax),%eax
  100886:	85 c0                	test   %eax,%eax
  100888:	74 97                	je     100821 <debuginfo_eip+0x1f6>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10088a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10088d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100890:	39 c2                	cmp    %eax,%edx
  100892:	7c 42                	jl     1008d6 <debuginfo_eip+0x2ab>
  100894:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100897:	89 c2                	mov    %eax,%edx
  100899:	89 d0                	mov    %edx,%eax
  10089b:	01 c0                	add    %eax,%eax
  10089d:	01 d0                	add    %edx,%eax
  10089f:	c1 e0 02             	shl    $0x2,%eax
  1008a2:	89 c2                	mov    %eax,%edx
  1008a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008a7:	01 d0                	add    %edx,%eax
  1008a9:	8b 10                	mov    (%eax),%edx
  1008ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008ae:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008b1:	39 c2                	cmp    %eax,%edx
  1008b3:	73 21                	jae    1008d6 <debuginfo_eip+0x2ab>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008b5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b8:	89 c2                	mov    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	01 c0                	add    %eax,%eax
  1008be:	01 d0                	add    %edx,%eax
  1008c0:	c1 e0 02             	shl    $0x2,%eax
  1008c3:	89 c2                	mov    %eax,%edx
  1008c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c8:	01 d0                	add    %edx,%eax
  1008ca:	8b 10                	mov    (%eax),%edx
  1008cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008cf:	01 c2                	add    %eax,%edx
  1008d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d4:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008d6:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008d9:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008dc:	39 c2                	cmp    %eax,%edx
  1008de:	7d 4a                	jge    10092a <debuginfo_eip+0x2ff>
        for (lline = lfun + 1;
  1008e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008e3:	83 c0 01             	add    $0x1,%eax
  1008e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008e9:	eb 18                	jmp    100903 <debuginfo_eip+0x2d8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	8b 40 14             	mov    0x14(%eax),%eax
  1008f1:	8d 50 01             	lea    0x1(%eax),%edx
  1008f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008f7:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008fd:	83 c0 01             	add    $0x1,%eax
  100900:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100903:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100906:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  100909:	39 c2                	cmp    %eax,%edx
  10090b:	7d 1d                	jge    10092a <debuginfo_eip+0x2ff>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10090d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100910:	89 c2                	mov    %eax,%edx
  100912:	89 d0                	mov    %edx,%eax
  100914:	01 c0                	add    %eax,%eax
  100916:	01 d0                	add    %edx,%eax
  100918:	c1 e0 02             	shl    $0x2,%eax
  10091b:	89 c2                	mov    %eax,%edx
  10091d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100920:	01 d0                	add    %edx,%eax
  100922:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100926:	3c a0                	cmp    $0xa0,%al
  100928:	74 c1                	je     1008eb <debuginfo_eip+0x2c0>
        }
    }
    return 0;
  10092a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10092f:	c9                   	leave  
  100930:	c3                   	ret    

00100931 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100931:	f3 0f 1e fb          	endbr32 
  100935:	55                   	push   %ebp
  100936:	89 e5                	mov    %esp,%ebp
  100938:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10093b:	83 ec 0c             	sub    $0xc,%esp
  10093e:	68 82 37 10 00       	push   $0x103782
  100943:	e8 2d f9 ff ff       	call   100275 <cprintf>
  100948:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10094b:	83 ec 08             	sub    $0x8,%esp
  10094e:	68 00 00 10 00       	push   $0x100000
  100953:	68 9b 37 10 00       	push   $0x10379b
  100958:	e8 18 f9 ff ff       	call   100275 <cprintf>
  10095d:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100960:	83 ec 08             	sub    $0x8,%esp
  100963:	68 69 36 10 00       	push   $0x103669
  100968:	68 b3 37 10 00       	push   $0x1037b3
  10096d:	e8 03 f9 ff ff       	call   100275 <cprintf>
  100972:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100975:	83 ec 08             	sub    $0x8,%esp
  100978:	68 16 fa 10 00       	push   $0x10fa16
  10097d:	68 cb 37 10 00       	push   $0x1037cb
  100982:	e8 ee f8 ff ff       	call   100275 <cprintf>
  100987:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10098a:	83 ec 08             	sub    $0x8,%esp
  10098d:	68 80 0d 11 00       	push   $0x110d80
  100992:	68 e3 37 10 00       	push   $0x1037e3
  100997:	e8 d9 f8 ff ff       	call   100275 <cprintf>
  10099c:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  10099f:	b8 80 0d 11 00       	mov    $0x110d80,%eax
  1009a4:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009a9:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009ae:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009b4:	85 c0                	test   %eax,%eax
  1009b6:	0f 48 c2             	cmovs  %edx,%eax
  1009b9:	c1 f8 0a             	sar    $0xa,%eax
  1009bc:	83 ec 08             	sub    $0x8,%esp
  1009bf:	50                   	push   %eax
  1009c0:	68 fc 37 10 00       	push   $0x1037fc
  1009c5:	e8 ab f8 ff ff       	call   100275 <cprintf>
  1009ca:	83 c4 10             	add    $0x10,%esp
}
  1009cd:	90                   	nop
  1009ce:	c9                   	leave  
  1009cf:	c3                   	ret    

001009d0 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009d0:	f3 0f 1e fb          	endbr32 
  1009d4:	55                   	push   %ebp
  1009d5:	89 e5                	mov    %esp,%ebp
  1009d7:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009dd:	83 ec 08             	sub    $0x8,%esp
  1009e0:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009e3:	50                   	push   %eax
  1009e4:	ff 75 08             	pushl  0x8(%ebp)
  1009e7:	e8 3f fc ff ff       	call   10062b <debuginfo_eip>
  1009ec:	83 c4 10             	add    $0x10,%esp
  1009ef:	85 c0                	test   %eax,%eax
  1009f1:	74 15                	je     100a08 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009f3:	83 ec 08             	sub    $0x8,%esp
  1009f6:	ff 75 08             	pushl  0x8(%ebp)
  1009f9:	68 26 38 10 00       	push   $0x103826
  1009fe:	e8 72 f8 ff ff       	call   100275 <cprintf>
  100a03:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a06:	eb 65                	jmp    100a6d <print_debuginfo+0x9d>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a0f:	eb 1c                	jmp    100a2d <print_debuginfo+0x5d>
            fnname[j] = info.eip_fn_name[j];
  100a11:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a17:	01 d0                	add    %edx,%eax
  100a19:	0f b6 00             	movzbl (%eax),%eax
  100a1c:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a22:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a25:	01 ca                	add    %ecx,%edx
  100a27:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100a2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a30:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a33:	7c dc                	jl     100a11 <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a35:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a3e:	01 d0                	add    %edx,%eax
  100a40:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a43:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a46:	8b 55 08             	mov    0x8(%ebp),%edx
  100a49:	89 d1                	mov    %edx,%ecx
  100a4b:	29 c1                	sub    %eax,%ecx
  100a4d:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a50:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a53:	83 ec 0c             	sub    $0xc,%esp
  100a56:	51                   	push   %ecx
  100a57:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a5d:	51                   	push   %ecx
  100a5e:	52                   	push   %edx
  100a5f:	50                   	push   %eax
  100a60:	68 42 38 10 00       	push   $0x103842
  100a65:	e8 0b f8 ff ff       	call   100275 <cprintf>
  100a6a:	83 c4 20             	add    $0x20,%esp
}
  100a6d:	90                   	nop
  100a6e:	c9                   	leave  
  100a6f:	c3                   	ret    

00100a70 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a70:	f3 0f 1e fb          	endbr32 
  100a74:	55                   	push   %ebp
  100a75:	89 e5                	mov    %esp,%ebp
  100a77:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a7a:	8b 45 04             	mov    0x4(%ebp),%eax
  100a7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a80:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a83:	c9                   	leave  
  100a84:	c3                   	ret    

00100a85 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a85:	f3 0f 1e fb          	endbr32 
  100a89:	55                   	push   %ebp
  100a8a:	89 e5                	mov    %esp,%ebp
  100a8c:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a8f:	89 e8                	mov    %ebp,%eax
  100a91:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a94:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
      uint32_t ebp=read_ebp();  //(1)
  100a97:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip=read_eip();  //(2)
  100a9a:	e8 d1 ff ff ff       	call   100a70 <read_eip>
  100a9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
      for (int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++)
  100aa2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100aa9:	e9 8d 00 00 00       	jmp    100b3b <print_stackframe+0xb6>
      {
	      cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);//(3.1)
  100aae:	83 ec 04             	sub    $0x4,%esp
  100ab1:	ff 75 f0             	pushl  -0x10(%ebp)
  100ab4:	ff 75 f4             	pushl  -0xc(%ebp)
  100ab7:	68 54 38 10 00       	push   $0x103854
  100abc:	e8 b4 f7 ff ff       	call   100275 <cprintf>
  100ac1:	83 c4 10             	add    $0x10,%esp
	      uint32_t *args = (uint32_t *)ebp+2;
  100ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ac7:	83 c0 08             	add    $0x8,%eax
  100aca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	      for(int j=0;j<4;j++)
  100acd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100ad4:	eb 26                	jmp    100afc <print_stackframe+0x77>
	      {
		      cprintf("0x%08x ",args[j]);
  100ad6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ad9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ae0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100ae3:	01 d0                	add    %edx,%eax
  100ae5:	8b 00                	mov    (%eax),%eax
  100ae7:	83 ec 08             	sub    $0x8,%esp
  100aea:	50                   	push   %eax
  100aeb:	68 70 38 10 00       	push   $0x103870
  100af0:	e8 80 f7 ff ff       	call   100275 <cprintf>
  100af5:	83 c4 10             	add    $0x10,%esp
	      for(int j=0;j<4;j++)
  100af8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100afc:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100b00:	7e d4                	jle    100ad6 <print_stackframe+0x51>
	      }//(3.2)
	      cprintf("\n");//(3.3)
  100b02:	83 ec 0c             	sub    $0xc,%esp
  100b05:	68 78 38 10 00       	push   $0x103878
  100b0a:	e8 66 f7 ff ff       	call   100275 <cprintf>
  100b0f:	83 c4 10             	add    $0x10,%esp
	      print_debuginfo(eip-1);//(3.4)
  100b12:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b15:	83 e8 01             	sub    $0x1,%eax
  100b18:	83 ec 0c             	sub    $0xc,%esp
  100b1b:	50                   	push   %eax
  100b1c:	e8 af fe ff ff       	call   1009d0 <print_debuginfo>
  100b21:	83 c4 10             	add    $0x10,%esp
	      eip = ((uint32_t *)ebp)[1];
  100b24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b27:	83 c0 04             	add    $0x4,%eax
  100b2a:	8b 00                	mov    (%eax),%eax
  100b2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	      ebp = ((uint32_t *)ebp)[0];//(3.5)
  100b2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b32:	8b 00                	mov    (%eax),%eax
  100b34:	89 45 f4             	mov    %eax,-0xc(%ebp)
      for (int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++)
  100b37:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100b3b:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b3f:	7f 0a                	jg     100b4b <print_stackframe+0xc6>
  100b41:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b45:	0f 85 63 ff ff ff    	jne    100aae <print_stackframe+0x29>
      }
}
  100b4b:	90                   	nop
  100b4c:	c9                   	leave  
  100b4d:	c3                   	ret    

00100b4e <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b4e:	f3 0f 1e fb          	endbr32 
  100b52:	55                   	push   %ebp
  100b53:	89 e5                	mov    %esp,%ebp
  100b55:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100b58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b5f:	eb 0c                	jmp    100b6d <parse+0x1f>
            *buf ++ = '\0';
  100b61:	8b 45 08             	mov    0x8(%ebp),%eax
  100b64:	8d 50 01             	lea    0x1(%eax),%edx
  100b67:	89 55 08             	mov    %edx,0x8(%ebp)
  100b6a:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b70:	0f b6 00             	movzbl (%eax),%eax
  100b73:	84 c0                	test   %al,%al
  100b75:	74 1e                	je     100b95 <parse+0x47>
  100b77:	8b 45 08             	mov    0x8(%ebp),%eax
  100b7a:	0f b6 00             	movzbl (%eax),%eax
  100b7d:	0f be c0             	movsbl %al,%eax
  100b80:	83 ec 08             	sub    $0x8,%esp
  100b83:	50                   	push   %eax
  100b84:	68 fc 38 10 00       	push   $0x1038fc
  100b89:	e8 4f 21 00 00       	call   102cdd <strchr>
  100b8e:	83 c4 10             	add    $0x10,%esp
  100b91:	85 c0                	test   %eax,%eax
  100b93:	75 cc                	jne    100b61 <parse+0x13>
        }
        if (*buf == '\0') {
  100b95:	8b 45 08             	mov    0x8(%ebp),%eax
  100b98:	0f b6 00             	movzbl (%eax),%eax
  100b9b:	84 c0                	test   %al,%al
  100b9d:	74 65                	je     100c04 <parse+0xb6>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b9f:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100ba3:	75 12                	jne    100bb7 <parse+0x69>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100ba5:	83 ec 08             	sub    $0x8,%esp
  100ba8:	6a 10                	push   $0x10
  100baa:	68 01 39 10 00       	push   $0x103901
  100baf:	e8 c1 f6 ff ff       	call   100275 <cprintf>
  100bb4:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bba:	8d 50 01             	lea    0x1(%eax),%edx
  100bbd:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bc0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bc7:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bca:	01 c2                	add    %eax,%edx
  100bcc:	8b 45 08             	mov    0x8(%ebp),%eax
  100bcf:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bd1:	eb 04                	jmp    100bd7 <parse+0x89>
            buf ++;
  100bd3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bd7:	8b 45 08             	mov    0x8(%ebp),%eax
  100bda:	0f b6 00             	movzbl (%eax),%eax
  100bdd:	84 c0                	test   %al,%al
  100bdf:	74 8c                	je     100b6d <parse+0x1f>
  100be1:	8b 45 08             	mov    0x8(%ebp),%eax
  100be4:	0f b6 00             	movzbl (%eax),%eax
  100be7:	0f be c0             	movsbl %al,%eax
  100bea:	83 ec 08             	sub    $0x8,%esp
  100bed:	50                   	push   %eax
  100bee:	68 fc 38 10 00       	push   $0x1038fc
  100bf3:	e8 e5 20 00 00       	call   102cdd <strchr>
  100bf8:	83 c4 10             	add    $0x10,%esp
  100bfb:	85 c0                	test   %eax,%eax
  100bfd:	74 d4                	je     100bd3 <parse+0x85>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bff:	e9 69 ff ff ff       	jmp    100b6d <parse+0x1f>
            break;
  100c04:	90                   	nop
        }
    }
    return argc;
  100c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c08:	c9                   	leave  
  100c09:	c3                   	ret    

00100c0a <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c0a:	f3 0f 1e fb          	endbr32 
  100c0e:	55                   	push   %ebp
  100c0f:	89 e5                	mov    %esp,%ebp
  100c11:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c14:	83 ec 08             	sub    $0x8,%esp
  100c17:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c1a:	50                   	push   %eax
  100c1b:	ff 75 08             	pushl  0x8(%ebp)
  100c1e:	e8 2b ff ff ff       	call   100b4e <parse>
  100c23:	83 c4 10             	add    $0x10,%esp
  100c26:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c29:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c2d:	75 0a                	jne    100c39 <runcmd+0x2f>
        return 0;
  100c2f:	b8 00 00 00 00       	mov    $0x0,%eax
  100c34:	e9 83 00 00 00       	jmp    100cbc <runcmd+0xb2>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c39:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c40:	eb 59                	jmp    100c9b <runcmd+0x91>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c42:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c45:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c48:	89 d0                	mov    %edx,%eax
  100c4a:	01 c0                	add    %eax,%eax
  100c4c:	01 d0                	add    %edx,%eax
  100c4e:	c1 e0 02             	shl    $0x2,%eax
  100c51:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c56:	8b 00                	mov    (%eax),%eax
  100c58:	83 ec 08             	sub    $0x8,%esp
  100c5b:	51                   	push   %ecx
  100c5c:	50                   	push   %eax
  100c5d:	e8 d4 1f 00 00       	call   102c36 <strcmp>
  100c62:	83 c4 10             	add    $0x10,%esp
  100c65:	85 c0                	test   %eax,%eax
  100c67:	75 2e                	jne    100c97 <runcmd+0x8d>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c69:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c6c:	89 d0                	mov    %edx,%eax
  100c6e:	01 c0                	add    %eax,%eax
  100c70:	01 d0                	add    %edx,%eax
  100c72:	c1 e0 02             	shl    $0x2,%eax
  100c75:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c7a:	8b 10                	mov    (%eax),%edx
  100c7c:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c7f:	83 c0 04             	add    $0x4,%eax
  100c82:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c85:	83 e9 01             	sub    $0x1,%ecx
  100c88:	83 ec 04             	sub    $0x4,%esp
  100c8b:	ff 75 0c             	pushl  0xc(%ebp)
  100c8e:	50                   	push   %eax
  100c8f:	51                   	push   %ecx
  100c90:	ff d2                	call   *%edx
  100c92:	83 c4 10             	add    $0x10,%esp
  100c95:	eb 25                	jmp    100cbc <runcmd+0xb2>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c97:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c9e:	83 f8 02             	cmp    $0x2,%eax
  100ca1:	76 9f                	jbe    100c42 <runcmd+0x38>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100ca3:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100ca6:	83 ec 08             	sub    $0x8,%esp
  100ca9:	50                   	push   %eax
  100caa:	68 1f 39 10 00       	push   $0x10391f
  100caf:	e8 c1 f5 ff ff       	call   100275 <cprintf>
  100cb4:	83 c4 10             	add    $0x10,%esp
    return 0;
  100cb7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cbc:	c9                   	leave  
  100cbd:	c3                   	ret    

00100cbe <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100cbe:	f3 0f 1e fb          	endbr32 
  100cc2:	55                   	push   %ebp
  100cc3:	89 e5                	mov    %esp,%ebp
  100cc5:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cc8:	83 ec 0c             	sub    $0xc,%esp
  100ccb:	68 38 39 10 00       	push   $0x103938
  100cd0:	e8 a0 f5 ff ff       	call   100275 <cprintf>
  100cd5:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100cd8:	83 ec 0c             	sub    $0xc,%esp
  100cdb:	68 60 39 10 00       	push   $0x103960
  100ce0:	e8 90 f5 ff ff       	call   100275 <cprintf>
  100ce5:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100ce8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cec:	74 0e                	je     100cfc <kmonitor+0x3e>
        print_trapframe(tf);
  100cee:	83 ec 0c             	sub    $0xc,%esp
  100cf1:	ff 75 08             	pushl  0x8(%ebp)
  100cf4:	e8 02 0e 00 00       	call   101afb <print_trapframe>
  100cf9:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cfc:	83 ec 0c             	sub    $0xc,%esp
  100cff:	68 85 39 10 00       	push   $0x103985
  100d04:	e8 21 f6 ff ff       	call   10032a <readline>
  100d09:	83 c4 10             	add    $0x10,%esp
  100d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d13:	74 e7                	je     100cfc <kmonitor+0x3e>
            if (runcmd(buf, tf) < 0) {
  100d15:	83 ec 08             	sub    $0x8,%esp
  100d18:	ff 75 08             	pushl  0x8(%ebp)
  100d1b:	ff 75 f4             	pushl  -0xc(%ebp)
  100d1e:	e8 e7 fe ff ff       	call   100c0a <runcmd>
  100d23:	83 c4 10             	add    $0x10,%esp
  100d26:	85 c0                	test   %eax,%eax
  100d28:	78 02                	js     100d2c <kmonitor+0x6e>
        if ((buf = readline("K> ")) != NULL) {
  100d2a:	eb d0                	jmp    100cfc <kmonitor+0x3e>
                break;
  100d2c:	90                   	nop
            }
        }
    }
}
  100d2d:	90                   	nop
  100d2e:	c9                   	leave  
  100d2f:	c3                   	ret    

00100d30 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d30:	f3 0f 1e fb          	endbr32 
  100d34:	55                   	push   %ebp
  100d35:	89 e5                	mov    %esp,%ebp
  100d37:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d41:	eb 3c                	jmp    100d7f <mon_help+0x4f>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d43:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d46:	89 d0                	mov    %edx,%eax
  100d48:	01 c0                	add    %eax,%eax
  100d4a:	01 d0                	add    %edx,%eax
  100d4c:	c1 e0 02             	shl    $0x2,%eax
  100d4f:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d54:	8b 08                	mov    (%eax),%ecx
  100d56:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d59:	89 d0                	mov    %edx,%eax
  100d5b:	01 c0                	add    %eax,%eax
  100d5d:	01 d0                	add    %edx,%eax
  100d5f:	c1 e0 02             	shl    $0x2,%eax
  100d62:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d67:	8b 00                	mov    (%eax),%eax
  100d69:	83 ec 04             	sub    $0x4,%esp
  100d6c:	51                   	push   %ecx
  100d6d:	50                   	push   %eax
  100d6e:	68 89 39 10 00       	push   $0x103989
  100d73:	e8 fd f4 ff ff       	call   100275 <cprintf>
  100d78:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100d7b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100d7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d82:	83 f8 02             	cmp    $0x2,%eax
  100d85:	76 bc                	jbe    100d43 <mon_help+0x13>
    }
    return 0;
  100d87:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d8c:	c9                   	leave  
  100d8d:	c3                   	ret    

00100d8e <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d8e:	f3 0f 1e fb          	endbr32 
  100d92:	55                   	push   %ebp
  100d93:	89 e5                	mov    %esp,%ebp
  100d95:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d98:	e8 94 fb ff ff       	call   100931 <print_kerninfo>
    return 0;
  100d9d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100da2:	c9                   	leave  
  100da3:	c3                   	ret    

00100da4 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100da4:	f3 0f 1e fb          	endbr32 
  100da8:	55                   	push   %ebp
  100da9:	89 e5                	mov    %esp,%ebp
  100dab:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100dae:	e8 d2 fc ff ff       	call   100a85 <print_stackframe>
    return 0;
  100db3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100db8:	c9                   	leave  
  100db9:	c3                   	ret    

00100dba <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dba:	f3 0f 1e fb          	endbr32 
  100dbe:	55                   	push   %ebp
  100dbf:	89 e5                	mov    %esp,%ebp
  100dc1:	83 ec 18             	sub    $0x18,%esp
  100dc4:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100dca:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dce:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dd2:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dd6:	ee                   	out    %al,(%dx)
}
  100dd7:	90                   	nop
  100dd8:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100dde:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de2:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100de6:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dea:	ee                   	out    %al,(%dx)
}
  100deb:	90                   	nop
  100dec:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100df2:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df6:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100dfa:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dfe:	ee                   	out    %al,(%dx)
}
  100dff:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100e00:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100e07:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e0a:	83 ec 0c             	sub    $0xc,%esp
  100e0d:	68 92 39 10 00       	push   $0x103992
  100e12:	e8 5e f4 ff ff       	call   100275 <cprintf>
  100e17:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100e1a:	83 ec 0c             	sub    $0xc,%esp
  100e1d:	6a 00                	push   $0x0
  100e1f:	e8 39 09 00 00       	call   10175d <pic_enable>
  100e24:	83 c4 10             	add    $0x10,%esp
}
  100e27:	90                   	nop
  100e28:	c9                   	leave  
  100e29:	c3                   	ret    

00100e2a <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e2a:	f3 0f 1e fb          	endbr32 
  100e2e:	55                   	push   %ebp
  100e2f:	89 e5                	mov    %esp,%ebp
  100e31:	83 ec 10             	sub    $0x10,%esp
  100e34:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e3a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e3e:	89 c2                	mov    %eax,%edx
  100e40:	ec                   	in     (%dx),%al
  100e41:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e44:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e4a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e4e:	89 c2                	mov    %eax,%edx
  100e50:	ec                   	in     (%dx),%al
  100e51:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e54:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e5a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e5e:	89 c2                	mov    %eax,%edx
  100e60:	ec                   	in     (%dx),%al
  100e61:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e64:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e6a:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e6e:	89 c2                	mov    %eax,%edx
  100e70:	ec                   	in     (%dx),%al
  100e71:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e74:	90                   	nop
  100e75:	c9                   	leave  
  100e76:	c3                   	ret    

00100e77 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e77:	f3 0f 1e fb          	endbr32 
  100e7b:	55                   	push   %ebp
  100e7c:	89 e5                	mov    %esp,%ebp
  100e7e:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e81:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e88:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e8b:	0f b7 00             	movzwl (%eax),%eax
  100e8e:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e92:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e95:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e9d:	0f b7 00             	movzwl (%eax),%eax
  100ea0:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100ea4:	74 12                	je     100eb8 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;
  100ea6:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100ead:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100eb4:	b4 03 
  100eb6:	eb 13                	jmp    100ecb <cga_init+0x54>
    } else {
        *cp = was;
  100eb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ebb:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ebf:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100ec2:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100ec9:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100ecb:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ed2:	0f b7 c0             	movzwl %ax,%eax
  100ed5:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ed9:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100edd:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ee1:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ee5:	ee                   	out    %al,(%dx)
}
  100ee6:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;
  100ee7:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eee:	83 c0 01             	add    $0x1,%eax
  100ef1:	0f b7 c0             	movzwl %ax,%eax
  100ef4:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ef8:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100efc:	89 c2                	mov    %eax,%edx
  100efe:	ec                   	in     (%dx),%al
  100eff:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100f02:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f06:	0f b6 c0             	movzbl %al,%eax
  100f09:	c1 e0 08             	shl    $0x8,%eax
  100f0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f0f:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f16:	0f b7 c0             	movzwl %ax,%eax
  100f19:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f1d:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f21:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f25:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f29:	ee                   	out    %al,(%dx)
}
  100f2a:	90                   	nop
    pos |= inb(addr_6845 + 1);
  100f2b:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f32:	83 c0 01             	add    $0x1,%eax
  100f35:	0f b7 c0             	movzwl %ax,%eax
  100f38:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f3c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f40:	89 c2                	mov    %eax,%edx
  100f42:	ec                   	in     (%dx),%al
  100f43:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f46:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f4a:	0f b6 c0             	movzbl %al,%eax
  100f4d:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100f50:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f53:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;
  100f58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f5b:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f61:	90                   	nop
  100f62:	c9                   	leave  
  100f63:	c3                   	ret    

00100f64 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f64:	f3 0f 1e fb          	endbr32 
  100f68:	55                   	push   %ebp
  100f69:	89 e5                	mov    %esp,%ebp
  100f6b:	83 ec 38             	sub    $0x38,%esp
  100f6e:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f74:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f78:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f7c:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f80:	ee                   	out    %al,(%dx)
}
  100f81:	90                   	nop
  100f82:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f88:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f8c:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f90:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f94:	ee                   	out    %al,(%dx)
}
  100f95:	90                   	nop
  100f96:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f9c:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fa0:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100fa4:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fa8:	ee                   	out    %al,(%dx)
}
  100fa9:	90                   	nop
  100faa:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100fb0:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fb4:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fb8:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fbc:	ee                   	out    %al,(%dx)
}
  100fbd:	90                   	nop
  100fbe:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fc4:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fc8:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fcc:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fd0:	ee                   	out    %al,(%dx)
}
  100fd1:	90                   	nop
  100fd2:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fd8:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fdc:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fe0:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fe4:	ee                   	out    %al,(%dx)
}
  100fe5:	90                   	nop
  100fe6:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fec:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ff0:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ff4:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ff8:	ee                   	out    %al,(%dx)
}
  100ff9:	90                   	nop
  100ffa:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101000:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  101004:	89 c2                	mov    %eax,%edx
  101006:	ec                   	in     (%dx),%al
  101007:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  10100a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  10100e:	3c ff                	cmp    $0xff,%al
  101010:	0f 95 c0             	setne  %al
  101013:	0f b6 c0             	movzbl %al,%eax
  101016:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  10101b:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101021:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101025:	89 c2                	mov    %eax,%edx
  101027:	ec                   	in     (%dx),%al
  101028:	88 45 f1             	mov    %al,-0xf(%ebp)
  10102b:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101031:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101035:	89 c2                	mov    %eax,%edx
  101037:	ec                   	in     (%dx),%al
  101038:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  10103b:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101040:	85 c0                	test   %eax,%eax
  101042:	74 0d                	je     101051 <serial_init+0xed>
        pic_enable(IRQ_COM1);
  101044:	83 ec 0c             	sub    $0xc,%esp
  101047:	6a 04                	push   $0x4
  101049:	e8 0f 07 00 00       	call   10175d <pic_enable>
  10104e:	83 c4 10             	add    $0x10,%esp
    }
}
  101051:	90                   	nop
  101052:	c9                   	leave  
  101053:	c3                   	ret    

00101054 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101054:	f3 0f 1e fb          	endbr32 
  101058:	55                   	push   %ebp
  101059:	89 e5                	mov    %esp,%ebp
  10105b:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10105e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101065:	eb 09                	jmp    101070 <lpt_putc_sub+0x1c>
        delay();
  101067:	e8 be fd ff ff       	call   100e2a <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10106c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101070:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101076:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10107a:	89 c2                	mov    %eax,%edx
  10107c:	ec                   	in     (%dx),%al
  10107d:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101080:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101084:	84 c0                	test   %al,%al
  101086:	78 09                	js     101091 <lpt_putc_sub+0x3d>
  101088:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10108f:	7e d6                	jle    101067 <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101091:	8b 45 08             	mov    0x8(%ebp),%eax
  101094:	0f b6 c0             	movzbl %al,%eax
  101097:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  10109d:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010a0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1010a4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010a8:	ee                   	out    %al,(%dx)
}
  1010a9:	90                   	nop
  1010aa:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010b0:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010b4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010b8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010bc:	ee                   	out    %al,(%dx)
}
  1010bd:	90                   	nop
  1010be:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010c4:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010c8:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010cc:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010d0:	ee                   	out    %al,(%dx)
}
  1010d1:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010d2:	90                   	nop
  1010d3:	c9                   	leave  
  1010d4:	c3                   	ret    

001010d5 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010d5:	f3 0f 1e fb          	endbr32 
  1010d9:	55                   	push   %ebp
  1010da:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  1010dc:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010e0:	74 0d                	je     1010ef <lpt_putc+0x1a>
        lpt_putc_sub(c);
  1010e2:	ff 75 08             	pushl  0x8(%ebp)
  1010e5:	e8 6a ff ff ff       	call   101054 <lpt_putc_sub>
  1010ea:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010ed:	eb 1e                	jmp    10110d <lpt_putc+0x38>
        lpt_putc_sub('\b');
  1010ef:	6a 08                	push   $0x8
  1010f1:	e8 5e ff ff ff       	call   101054 <lpt_putc_sub>
  1010f6:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  1010f9:	6a 20                	push   $0x20
  1010fb:	e8 54 ff ff ff       	call   101054 <lpt_putc_sub>
  101100:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101103:	6a 08                	push   $0x8
  101105:	e8 4a ff ff ff       	call   101054 <lpt_putc_sub>
  10110a:	83 c4 04             	add    $0x4,%esp
}
  10110d:	90                   	nop
  10110e:	c9                   	leave  
  10110f:	c3                   	ret    

00101110 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101110:	f3 0f 1e fb          	endbr32 
  101114:	55                   	push   %ebp
  101115:	89 e5                	mov    %esp,%ebp
  101117:	53                   	push   %ebx
  101118:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10111b:	8b 45 08             	mov    0x8(%ebp),%eax
  10111e:	b0 00                	mov    $0x0,%al
  101120:	85 c0                	test   %eax,%eax
  101122:	75 07                	jne    10112b <cga_putc+0x1b>
        c |= 0x0700;
  101124:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10112b:	8b 45 08             	mov    0x8(%ebp),%eax
  10112e:	0f b6 c0             	movzbl %al,%eax
  101131:	83 f8 0d             	cmp    $0xd,%eax
  101134:	74 6c                	je     1011a2 <cga_putc+0x92>
  101136:	83 f8 0d             	cmp    $0xd,%eax
  101139:	0f 8f 9d 00 00 00    	jg     1011dc <cga_putc+0xcc>
  10113f:	83 f8 08             	cmp    $0x8,%eax
  101142:	74 0a                	je     10114e <cga_putc+0x3e>
  101144:	83 f8 0a             	cmp    $0xa,%eax
  101147:	74 49                	je     101192 <cga_putc+0x82>
  101149:	e9 8e 00 00 00       	jmp    1011dc <cga_putc+0xcc>
    case '\b':
        if (crt_pos > 0) {
  10114e:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101155:	66 85 c0             	test   %ax,%ax
  101158:	0f 84 a4 00 00 00    	je     101202 <cga_putc+0xf2>
            crt_pos --;
  10115e:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101165:	83 e8 01             	sub    $0x1,%eax
  101168:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10116e:	8b 45 08             	mov    0x8(%ebp),%eax
  101171:	b0 00                	mov    $0x0,%al
  101173:	83 c8 20             	or     $0x20,%eax
  101176:	89 c1                	mov    %eax,%ecx
  101178:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10117d:	0f b7 15 64 fe 10 00 	movzwl 0x10fe64,%edx
  101184:	0f b7 d2             	movzwl %dx,%edx
  101187:	01 d2                	add    %edx,%edx
  101189:	01 d0                	add    %edx,%eax
  10118b:	89 ca                	mov    %ecx,%edx
  10118d:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  101190:	eb 70                	jmp    101202 <cga_putc+0xf2>
    case '\n':
        crt_pos += CRT_COLS;
  101192:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101199:	83 c0 50             	add    $0x50,%eax
  10119c:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011a2:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011a9:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011b0:	0f b7 c1             	movzwl %cx,%eax
  1011b3:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1011b9:	c1 e8 10             	shr    $0x10,%eax
  1011bc:	89 c2                	mov    %eax,%edx
  1011be:	66 c1 ea 06          	shr    $0x6,%dx
  1011c2:	89 d0                	mov    %edx,%eax
  1011c4:	c1 e0 02             	shl    $0x2,%eax
  1011c7:	01 d0                	add    %edx,%eax
  1011c9:	c1 e0 04             	shl    $0x4,%eax
  1011cc:	29 c1                	sub    %eax,%ecx
  1011ce:	89 ca                	mov    %ecx,%edx
  1011d0:	89 d8                	mov    %ebx,%eax
  1011d2:	29 d0                	sub    %edx,%eax
  1011d4:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011da:	eb 27                	jmp    101203 <cga_putc+0xf3>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011dc:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011e2:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011e9:	8d 50 01             	lea    0x1(%eax),%edx
  1011ec:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011f3:	0f b7 c0             	movzwl %ax,%eax
  1011f6:	01 c0                	add    %eax,%eax
  1011f8:	01 c8                	add    %ecx,%eax
  1011fa:	8b 55 08             	mov    0x8(%ebp),%edx
  1011fd:	66 89 10             	mov    %dx,(%eax)
        break;
  101200:	eb 01                	jmp    101203 <cga_putc+0xf3>
        break;
  101202:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101203:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10120a:	66 3d cf 07          	cmp    $0x7cf,%ax
  10120e:	76 59                	jbe    101269 <cga_putc+0x159>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101210:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101215:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10121b:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101220:	83 ec 04             	sub    $0x4,%esp
  101223:	68 00 0f 00 00       	push   $0xf00
  101228:	52                   	push   %edx
  101229:	50                   	push   %eax
  10122a:	e8 bc 1c 00 00       	call   102eeb <memmove>
  10122f:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101232:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101239:	eb 15                	jmp    101250 <cga_putc+0x140>
            crt_buf[i] = 0x0700 | ' ';
  10123b:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101240:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101243:	01 d2                	add    %edx,%edx
  101245:	01 d0                	add    %edx,%eax
  101247:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10124c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101250:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101257:	7e e2                	jle    10123b <cga_putc+0x12b>
        }
        crt_pos -= CRT_COLS;
  101259:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101260:	83 e8 50             	sub    $0x50,%eax
  101263:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101269:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101270:	0f b7 c0             	movzwl %ax,%eax
  101273:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101277:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10127b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10127f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101283:	ee                   	out    %al,(%dx)
}
  101284:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101285:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10128c:	66 c1 e8 08          	shr    $0x8,%ax
  101290:	0f b6 c0             	movzbl %al,%eax
  101293:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10129a:	83 c2 01             	add    $0x1,%edx
  10129d:	0f b7 d2             	movzwl %dx,%edx
  1012a0:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012a4:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012a7:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012ab:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012af:	ee                   	out    %al,(%dx)
}
  1012b0:	90                   	nop
    outb(addr_6845, 15);
  1012b1:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012b8:	0f b7 c0             	movzwl %ax,%eax
  1012bb:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012bf:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012c3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012c7:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012cb:	ee                   	out    %al,(%dx)
}
  1012cc:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012cd:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012d4:	0f b6 c0             	movzbl %al,%eax
  1012d7:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012de:	83 c2 01             	add    $0x1,%edx
  1012e1:	0f b7 d2             	movzwl %dx,%edx
  1012e4:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012e8:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012eb:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012ef:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012f3:	ee                   	out    %al,(%dx)
}
  1012f4:	90                   	nop
}
  1012f5:	90                   	nop
  1012f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012f9:	c9                   	leave  
  1012fa:	c3                   	ret    

001012fb <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012fb:	f3 0f 1e fb          	endbr32 
  1012ff:	55                   	push   %ebp
  101300:	89 e5                	mov    %esp,%ebp
  101302:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101305:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10130c:	eb 09                	jmp    101317 <serial_putc_sub+0x1c>
        delay();
  10130e:	e8 17 fb ff ff       	call   100e2a <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101313:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101317:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10131d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101321:	89 c2                	mov    %eax,%edx
  101323:	ec                   	in     (%dx),%al
  101324:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101327:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10132b:	0f b6 c0             	movzbl %al,%eax
  10132e:	83 e0 20             	and    $0x20,%eax
  101331:	85 c0                	test   %eax,%eax
  101333:	75 09                	jne    10133e <serial_putc_sub+0x43>
  101335:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10133c:	7e d0                	jle    10130e <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  10133e:	8b 45 08             	mov    0x8(%ebp),%eax
  101341:	0f b6 c0             	movzbl %al,%eax
  101344:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10134a:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10134d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101351:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101355:	ee                   	out    %al,(%dx)
}
  101356:	90                   	nop
}
  101357:	90                   	nop
  101358:	c9                   	leave  
  101359:	c3                   	ret    

0010135a <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10135a:	f3 0f 1e fb          	endbr32 
  10135e:	55                   	push   %ebp
  10135f:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101361:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101365:	74 0d                	je     101374 <serial_putc+0x1a>
        serial_putc_sub(c);
  101367:	ff 75 08             	pushl  0x8(%ebp)
  10136a:	e8 8c ff ff ff       	call   1012fb <serial_putc_sub>
  10136f:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101372:	eb 1e                	jmp    101392 <serial_putc+0x38>
        serial_putc_sub('\b');
  101374:	6a 08                	push   $0x8
  101376:	e8 80 ff ff ff       	call   1012fb <serial_putc_sub>
  10137b:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  10137e:	6a 20                	push   $0x20
  101380:	e8 76 ff ff ff       	call   1012fb <serial_putc_sub>
  101385:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  101388:	6a 08                	push   $0x8
  10138a:	e8 6c ff ff ff       	call   1012fb <serial_putc_sub>
  10138f:	83 c4 04             	add    $0x4,%esp
}
  101392:	90                   	nop
  101393:	c9                   	leave  
  101394:	c3                   	ret    

00101395 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101395:	f3 0f 1e fb          	endbr32 
  101399:	55                   	push   %ebp
  10139a:	89 e5                	mov    %esp,%ebp
  10139c:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10139f:	eb 33                	jmp    1013d4 <cons_intr+0x3f>
        if (c != 0) {
  1013a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013a5:	74 2d                	je     1013d4 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013a7:	a1 84 00 11 00       	mov    0x110084,%eax
  1013ac:	8d 50 01             	lea    0x1(%eax),%edx
  1013af:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013b8:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013be:	a1 84 00 11 00       	mov    0x110084,%eax
  1013c3:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013c8:	75 0a                	jne    1013d4 <cons_intr+0x3f>
                cons.wpos = 0;
  1013ca:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013d1:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1013d7:	ff d0                	call   *%eax
  1013d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013dc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013e0:	75 bf                	jne    1013a1 <cons_intr+0xc>
            }
        }
    }
}
  1013e2:	90                   	nop
  1013e3:	90                   	nop
  1013e4:	c9                   	leave  
  1013e5:	c3                   	ret    

001013e6 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013e6:	f3 0f 1e fb          	endbr32 
  1013ea:	55                   	push   %ebp
  1013eb:	89 e5                	mov    %esp,%ebp
  1013ed:	83 ec 10             	sub    $0x10,%esp
  1013f0:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013f6:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1013fa:	89 c2                	mov    %eax,%edx
  1013fc:	ec                   	in     (%dx),%al
  1013fd:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101400:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101404:	0f b6 c0             	movzbl %al,%eax
  101407:	83 e0 01             	and    $0x1,%eax
  10140a:	85 c0                	test   %eax,%eax
  10140c:	75 07                	jne    101415 <serial_proc_data+0x2f>
        return -1;
  10140e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101413:	eb 2a                	jmp    10143f <serial_proc_data+0x59>
  101415:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10141b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10141f:	89 c2                	mov    %eax,%edx
  101421:	ec                   	in     (%dx),%al
  101422:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101425:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101429:	0f b6 c0             	movzbl %al,%eax
  10142c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10142f:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101433:	75 07                	jne    10143c <serial_proc_data+0x56>
        c = '\b';
  101435:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10143c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10143f:	c9                   	leave  
  101440:	c3                   	ret    

00101441 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101441:	f3 0f 1e fb          	endbr32 
  101445:	55                   	push   %ebp
  101446:	89 e5                	mov    %esp,%ebp
  101448:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  10144b:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101450:	85 c0                	test   %eax,%eax
  101452:	74 10                	je     101464 <serial_intr+0x23>
        cons_intr(serial_proc_data);
  101454:	83 ec 0c             	sub    $0xc,%esp
  101457:	68 e6 13 10 00       	push   $0x1013e6
  10145c:	e8 34 ff ff ff       	call   101395 <cons_intr>
  101461:	83 c4 10             	add    $0x10,%esp
    }
}
  101464:	90                   	nop
  101465:	c9                   	leave  
  101466:	c3                   	ret    

00101467 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101467:	f3 0f 1e fb          	endbr32 
  10146b:	55                   	push   %ebp
  10146c:	89 e5                	mov    %esp,%ebp
  10146e:	83 ec 28             	sub    $0x28,%esp
  101471:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101477:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10147b:	89 c2                	mov    %eax,%edx
  10147d:	ec                   	in     (%dx),%al
  10147e:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101481:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101485:	0f b6 c0             	movzbl %al,%eax
  101488:	83 e0 01             	and    $0x1,%eax
  10148b:	85 c0                	test   %eax,%eax
  10148d:	75 0a                	jne    101499 <kbd_proc_data+0x32>
        return -1;
  10148f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101494:	e9 5e 01 00 00       	jmp    1015f7 <kbd_proc_data+0x190>
  101499:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10149f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1014a3:	89 c2                	mov    %eax,%edx
  1014a5:	ec                   	in     (%dx),%al
  1014a6:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014a9:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014ad:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014b0:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014b4:	75 17                	jne    1014cd <kbd_proc_data+0x66>
        // E0 escape character
        shift |= E0ESC;
  1014b6:	a1 88 00 11 00       	mov    0x110088,%eax
  1014bb:	83 c8 40             	or     $0x40,%eax
  1014be:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014c3:	b8 00 00 00 00       	mov    $0x0,%eax
  1014c8:	e9 2a 01 00 00       	jmp    1015f7 <kbd_proc_data+0x190>
    } else if (data & 0x80) {
  1014cd:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014d1:	84 c0                	test   %al,%al
  1014d3:	79 47                	jns    10151c <kbd_proc_data+0xb5>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014d5:	a1 88 00 11 00       	mov    0x110088,%eax
  1014da:	83 e0 40             	and    $0x40,%eax
  1014dd:	85 c0                	test   %eax,%eax
  1014df:	75 09                	jne    1014ea <kbd_proc_data+0x83>
  1014e1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014e5:	83 e0 7f             	and    $0x7f,%eax
  1014e8:	eb 04                	jmp    1014ee <kbd_proc_data+0x87>
  1014ea:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ee:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014f1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f5:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014fc:	83 c8 40             	or     $0x40,%eax
  1014ff:	0f b6 c0             	movzbl %al,%eax
  101502:	f7 d0                	not    %eax
  101504:	89 c2                	mov    %eax,%edx
  101506:	a1 88 00 11 00       	mov    0x110088,%eax
  10150b:	21 d0                	and    %edx,%eax
  10150d:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101512:	b8 00 00 00 00       	mov    $0x0,%eax
  101517:	e9 db 00 00 00       	jmp    1015f7 <kbd_proc_data+0x190>
    } else if (shift & E0ESC) {
  10151c:	a1 88 00 11 00       	mov    0x110088,%eax
  101521:	83 e0 40             	and    $0x40,%eax
  101524:	85 c0                	test   %eax,%eax
  101526:	74 11                	je     101539 <kbd_proc_data+0xd2>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101528:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10152c:	a1 88 00 11 00       	mov    0x110088,%eax
  101531:	83 e0 bf             	and    $0xffffffbf,%eax
  101534:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101539:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10153d:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101544:	0f b6 d0             	movzbl %al,%edx
  101547:	a1 88 00 11 00       	mov    0x110088,%eax
  10154c:	09 d0                	or     %edx,%eax
  10154e:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  101553:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101557:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  10155e:	0f b6 d0             	movzbl %al,%edx
  101561:	a1 88 00 11 00       	mov    0x110088,%eax
  101566:	31 d0                	xor    %edx,%eax
  101568:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  10156d:	a1 88 00 11 00       	mov    0x110088,%eax
  101572:	83 e0 03             	and    $0x3,%eax
  101575:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  10157c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101580:	01 d0                	add    %edx,%eax
  101582:	0f b6 00             	movzbl (%eax),%eax
  101585:	0f b6 c0             	movzbl %al,%eax
  101588:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  10158b:	a1 88 00 11 00       	mov    0x110088,%eax
  101590:	83 e0 08             	and    $0x8,%eax
  101593:	85 c0                	test   %eax,%eax
  101595:	74 22                	je     1015b9 <kbd_proc_data+0x152>
        if ('a' <= c && c <= 'z')
  101597:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  10159b:	7e 0c                	jle    1015a9 <kbd_proc_data+0x142>
  10159d:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015a1:	7f 06                	jg     1015a9 <kbd_proc_data+0x142>
            c += 'A' - 'a';
  1015a3:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015a7:	eb 10                	jmp    1015b9 <kbd_proc_data+0x152>
        else if ('A' <= c && c <= 'Z')
  1015a9:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015ad:	7e 0a                	jle    1015b9 <kbd_proc_data+0x152>
  1015af:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015b3:	7f 04                	jg     1015b9 <kbd_proc_data+0x152>
            c += 'a' - 'A';
  1015b5:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015b9:	a1 88 00 11 00       	mov    0x110088,%eax
  1015be:	f7 d0                	not    %eax
  1015c0:	83 e0 06             	and    $0x6,%eax
  1015c3:	85 c0                	test   %eax,%eax
  1015c5:	75 2d                	jne    1015f4 <kbd_proc_data+0x18d>
  1015c7:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015ce:	75 24                	jne    1015f4 <kbd_proc_data+0x18d>
        cprintf("Rebooting!\n");
  1015d0:	83 ec 0c             	sub    $0xc,%esp
  1015d3:	68 ad 39 10 00       	push   $0x1039ad
  1015d8:	e8 98 ec ff ff       	call   100275 <cprintf>
  1015dd:	83 c4 10             	add    $0x10,%esp
  1015e0:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015e6:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015ea:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015ee:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1015f2:	ee                   	out    %al,(%dx)
}
  1015f3:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015f7:	c9                   	leave  
  1015f8:	c3                   	ret    

001015f9 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015f9:	f3 0f 1e fb          	endbr32 
  1015fd:	55                   	push   %ebp
  1015fe:	89 e5                	mov    %esp,%ebp
  101600:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  101603:	83 ec 0c             	sub    $0xc,%esp
  101606:	68 67 14 10 00       	push   $0x101467
  10160b:	e8 85 fd ff ff       	call   101395 <cons_intr>
  101610:	83 c4 10             	add    $0x10,%esp
}
  101613:	90                   	nop
  101614:	c9                   	leave  
  101615:	c3                   	ret    

00101616 <kbd_init>:

static void
kbd_init(void) {
  101616:	f3 0f 1e fb          	endbr32 
  10161a:	55                   	push   %ebp
  10161b:	89 e5                	mov    %esp,%ebp
  10161d:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101620:	e8 d4 ff ff ff       	call   1015f9 <kbd_intr>
    pic_enable(IRQ_KBD);
  101625:	83 ec 0c             	sub    $0xc,%esp
  101628:	6a 01                	push   $0x1
  10162a:	e8 2e 01 00 00       	call   10175d <pic_enable>
  10162f:	83 c4 10             	add    $0x10,%esp
}
  101632:	90                   	nop
  101633:	c9                   	leave  
  101634:	c3                   	ret    

00101635 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101635:	f3 0f 1e fb          	endbr32 
  101639:	55                   	push   %ebp
  10163a:	89 e5                	mov    %esp,%ebp
  10163c:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  10163f:	e8 33 f8 ff ff       	call   100e77 <cga_init>
    serial_init();
  101644:	e8 1b f9 ff ff       	call   100f64 <serial_init>
    kbd_init();
  101649:	e8 c8 ff ff ff       	call   101616 <kbd_init>
    if (!serial_exists) {
  10164e:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101653:	85 c0                	test   %eax,%eax
  101655:	75 10                	jne    101667 <cons_init+0x32>
        cprintf("serial port does not exist!!\n");
  101657:	83 ec 0c             	sub    $0xc,%esp
  10165a:	68 b9 39 10 00       	push   $0x1039b9
  10165f:	e8 11 ec ff ff       	call   100275 <cprintf>
  101664:	83 c4 10             	add    $0x10,%esp
    }
}
  101667:	90                   	nop
  101668:	c9                   	leave  
  101669:	c3                   	ret    

0010166a <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10166a:	f3 0f 1e fb          	endbr32 
  10166e:	55                   	push   %ebp
  10166f:	89 e5                	mov    %esp,%ebp
  101671:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101674:	ff 75 08             	pushl  0x8(%ebp)
  101677:	e8 59 fa ff ff       	call   1010d5 <lpt_putc>
  10167c:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  10167f:	83 ec 0c             	sub    $0xc,%esp
  101682:	ff 75 08             	pushl  0x8(%ebp)
  101685:	e8 86 fa ff ff       	call   101110 <cga_putc>
  10168a:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  10168d:	83 ec 0c             	sub    $0xc,%esp
  101690:	ff 75 08             	pushl  0x8(%ebp)
  101693:	e8 c2 fc ff ff       	call   10135a <serial_putc>
  101698:	83 c4 10             	add    $0x10,%esp
}
  10169b:	90                   	nop
  10169c:	c9                   	leave  
  10169d:	c3                   	ret    

0010169e <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10169e:	f3 0f 1e fb          	endbr32 
  1016a2:	55                   	push   %ebp
  1016a3:	89 e5                	mov    %esp,%ebp
  1016a5:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016a8:	e8 94 fd ff ff       	call   101441 <serial_intr>
    kbd_intr();
  1016ad:	e8 47 ff ff ff       	call   1015f9 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016b2:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1016b8:	a1 84 00 11 00       	mov    0x110084,%eax
  1016bd:	39 c2                	cmp    %eax,%edx
  1016bf:	74 36                	je     1016f7 <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016c1:	a1 80 00 11 00       	mov    0x110080,%eax
  1016c6:	8d 50 01             	lea    0x1(%eax),%edx
  1016c9:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016cf:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016d6:	0f b6 c0             	movzbl %al,%eax
  1016d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016dc:	a1 80 00 11 00       	mov    0x110080,%eax
  1016e1:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016e6:	75 0a                	jne    1016f2 <cons_getc+0x54>
            cons.rpos = 0;
  1016e8:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016ef:	00 00 00 
        }
        return c;
  1016f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016f5:	eb 05                	jmp    1016fc <cons_getc+0x5e>
    }
    return 0;
  1016f7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016fc:	c9                   	leave  
  1016fd:	c3                   	ret    

001016fe <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016fe:	f3 0f 1e fb          	endbr32 
  101702:	55                   	push   %ebp
  101703:	89 e5                	mov    %esp,%ebp
  101705:	83 ec 14             	sub    $0x14,%esp
  101708:	8b 45 08             	mov    0x8(%ebp),%eax
  10170b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10170f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101713:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  101719:	a1 8c 00 11 00       	mov    0x11008c,%eax
  10171e:	85 c0                	test   %eax,%eax
  101720:	74 38                	je     10175a <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101722:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101726:	0f b6 c0             	movzbl %al,%eax
  101729:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  10172f:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101732:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101736:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10173a:	ee                   	out    %al,(%dx)
}
  10173b:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  10173c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101740:	66 c1 e8 08          	shr    $0x8,%ax
  101744:	0f b6 c0             	movzbl %al,%eax
  101747:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10174d:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101750:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101754:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101758:	ee                   	out    %al,(%dx)
}
  101759:	90                   	nop
    }
}
  10175a:	90                   	nop
  10175b:	c9                   	leave  
  10175c:	c3                   	ret    

0010175d <pic_enable>:

void
pic_enable(unsigned int irq) {
  10175d:	f3 0f 1e fb          	endbr32 
  101761:	55                   	push   %ebp
  101762:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101764:	8b 45 08             	mov    0x8(%ebp),%eax
  101767:	ba 01 00 00 00       	mov    $0x1,%edx
  10176c:	89 c1                	mov    %eax,%ecx
  10176e:	d3 e2                	shl    %cl,%edx
  101770:	89 d0                	mov    %edx,%eax
  101772:	f7 d0                	not    %eax
  101774:	89 c2                	mov    %eax,%edx
  101776:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  10177d:	21 d0                	and    %edx,%eax
  10177f:	0f b7 c0             	movzwl %ax,%eax
  101782:	50                   	push   %eax
  101783:	e8 76 ff ff ff       	call   1016fe <pic_setmask>
  101788:	83 c4 04             	add    $0x4,%esp
}
  10178b:	90                   	nop
  10178c:	c9                   	leave  
  10178d:	c3                   	ret    

0010178e <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10178e:	f3 0f 1e fb          	endbr32 
  101792:	55                   	push   %ebp
  101793:	89 e5                	mov    %esp,%ebp
  101795:	83 ec 40             	sub    $0x40,%esp
    did_init = 1;
  101798:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  10179f:	00 00 00 
  1017a2:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017a8:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ac:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017b0:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017b4:	ee                   	out    %al,(%dx)
}
  1017b5:	90                   	nop
  1017b6:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017bc:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017c0:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017c4:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017c8:	ee                   	out    %al,(%dx)
}
  1017c9:	90                   	nop
  1017ca:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017d0:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d4:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017d8:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017dc:	ee                   	out    %al,(%dx)
}
  1017dd:	90                   	nop
  1017de:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017e4:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e8:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017ec:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017f0:	ee                   	out    %al,(%dx)
}
  1017f1:	90                   	nop
  1017f2:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017f8:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017fc:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101800:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101804:	ee                   	out    %al,(%dx)
}
  101805:	90                   	nop
  101806:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10180c:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101810:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101814:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101818:	ee                   	out    %al,(%dx)
}
  101819:	90                   	nop
  10181a:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101820:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101824:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101828:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10182c:	ee                   	out    %al,(%dx)
}
  10182d:	90                   	nop
  10182e:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101834:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101838:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10183c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101840:	ee                   	out    %al,(%dx)
}
  101841:	90                   	nop
  101842:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101848:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10184c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101850:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101854:	ee                   	out    %al,(%dx)
}
  101855:	90                   	nop
  101856:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10185c:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101860:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101864:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101868:	ee                   	out    %al,(%dx)
}
  101869:	90                   	nop
  10186a:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101870:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101874:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101878:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10187c:	ee                   	out    %al,(%dx)
}
  10187d:	90                   	nop
  10187e:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101884:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101888:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10188c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101890:	ee                   	out    %al,(%dx)
}
  101891:	90                   	nop
  101892:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101898:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10189c:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1018a0:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1018a4:	ee                   	out    %al,(%dx)
}
  1018a5:	90                   	nop
  1018a6:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018ac:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018b0:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018b4:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018b8:	ee                   	out    %al,(%dx)
}
  1018b9:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018ba:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018c1:	66 83 f8 ff          	cmp    $0xffff,%ax
  1018c5:	74 13                	je     1018da <pic_init+0x14c>
        pic_setmask(irq_mask);
  1018c7:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018ce:	0f b7 c0             	movzwl %ax,%eax
  1018d1:	50                   	push   %eax
  1018d2:	e8 27 fe ff ff       	call   1016fe <pic_setmask>
  1018d7:	83 c4 04             	add    $0x4,%esp
    }
}
  1018da:	90                   	nop
  1018db:	c9                   	leave  
  1018dc:	c3                   	ret    

001018dd <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018dd:	f3 0f 1e fb          	endbr32 
  1018e1:	55                   	push   %ebp
  1018e2:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018e4:	fb                   	sti    
}
  1018e5:	90                   	nop
    sti();
}
  1018e6:	90                   	nop
  1018e7:	5d                   	pop    %ebp
  1018e8:	c3                   	ret    

001018e9 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018e9:	f3 0f 1e fb          	endbr32 
  1018ed:	55                   	push   %ebp
  1018ee:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018f0:	fa                   	cli    
}
  1018f1:	90                   	nop
    cli();
}
  1018f2:	90                   	nop
  1018f3:	5d                   	pop    %ebp
  1018f4:	c3                   	ret    

001018f5 <print_ticks>:
#include <console.h>
#include <kdebug.h>
#include <string.h>
#define TICK_NUM 100

static void print_ticks() {
  1018f5:	f3 0f 1e fb          	endbr32 
  1018f9:	55                   	push   %ebp
  1018fa:	89 e5                	mov    %esp,%ebp
  1018fc:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1018ff:	83 ec 08             	sub    $0x8,%esp
  101902:	6a 64                	push   $0x64
  101904:	68 e0 39 10 00       	push   $0x1039e0
  101909:	e8 67 e9 ff ff       	call   100275 <cprintf>
  10190e:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101911:	83 ec 0c             	sub    $0xc,%esp
  101914:	68 ea 39 10 00       	push   $0x1039ea
  101919:	e8 57 e9 ff ff       	call   100275 <cprintf>
  10191e:	83 c4 10             	add    $0x10,%esp
    panic("EOT: kernel seems ok.");
  101921:	83 ec 04             	sub    $0x4,%esp
  101924:	68 f8 39 10 00       	push   $0x1039f8
  101929:	6a 12                	push   $0x12
  10192b:	68 0e 3a 10 00       	push   $0x103a0e
  101930:	e8 bb ea ff ff       	call   1003f0 <__panic>

00101935 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101935:	f3 0f 1e fb          	endbr32 
  101939:	55                   	push   %ebp
  10193a:	89 e5                	mov    %esp,%ebp
  10193c:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  10193f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101946:	e9 c3 00 00 00       	jmp    101a0e <idt_init+0xd9>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  10194b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10194e:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101955:	89 c2                	mov    %eax,%edx
  101957:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10195a:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  101961:	00 
  101962:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101965:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  10196c:	00 08 00 
  10196f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101972:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101979:	00 
  10197a:	83 e2 e0             	and    $0xffffffe0,%edx
  10197d:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101984:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101987:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10198e:	00 
  10198f:	83 e2 1f             	and    $0x1f,%edx
  101992:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101999:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10199c:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019a3:	00 
  1019a4:	83 e2 f0             	and    $0xfffffff0,%edx
  1019a7:	83 ca 0e             	or     $0xe,%edx
  1019aa:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019b4:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019bb:	00 
  1019bc:	83 e2 ef             	and    $0xffffffef,%edx
  1019bf:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019c9:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019d0:	00 
  1019d1:	83 e2 9f             	and    $0xffffff9f,%edx
  1019d4:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019db:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019de:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019e5:	00 
  1019e6:	83 ca 80             	or     $0xffffff80,%edx
  1019e9:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f3:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1019fa:	c1 e8 10             	shr    $0x10,%eax
  1019fd:	89 c2                	mov    %eax,%edx
  1019ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a02:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  101a09:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101a0a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101a0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a11:	3d ff 00 00 00       	cmp    $0xff,%eax
  101a16:	0f 86 2f ff ff ff    	jbe    10194b <idt_init+0x16>
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101a1c:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a21:	66 a3 68 04 11 00    	mov    %ax,0x110468
  101a27:	66 c7 05 6a 04 11 00 	movw   $0x8,0x11046a
  101a2e:	08 00 
  101a30:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a37:	83 e0 e0             	and    $0xffffffe0,%eax
  101a3a:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a3f:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a46:	83 e0 1f             	and    $0x1f,%eax
  101a49:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a4e:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a55:	83 e0 f0             	and    $0xfffffff0,%eax
  101a58:	83 c8 0e             	or     $0xe,%eax
  101a5b:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a60:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a67:	83 e0 ef             	and    $0xffffffef,%eax
  101a6a:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a6f:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a76:	83 c8 60             	or     $0x60,%eax
  101a79:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a7e:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a85:	83 c8 80             	or     $0xffffff80,%eax
  101a88:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a8d:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a92:	c1 e8 10             	shr    $0x10,%eax
  101a95:	66 a3 6e 04 11 00    	mov    %ax,0x11046e
  101a9b:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101aa2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101aa5:	0f 01 18             	lidtl  (%eax)
}
  101aa8:	90                   	nop
	// load the IDT
    lidt(&idt_pd);
}
  101aa9:	90                   	nop
  101aaa:	c9                   	leave  
  101aab:	c3                   	ret    

00101aac <trapname>:

static const char *
trapname(int trapno) {
  101aac:	f3 0f 1e fb          	endbr32 
  101ab0:	55                   	push   %ebp
  101ab1:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101ab3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab6:	83 f8 13             	cmp    $0x13,%eax
  101ab9:	77 0c                	ja     101ac7 <trapname+0x1b>
        return excnames[trapno];
  101abb:	8b 45 08             	mov    0x8(%ebp),%eax
  101abe:	8b 04 85 60 3d 10 00 	mov    0x103d60(,%eax,4),%eax
  101ac5:	eb 18                	jmp    101adf <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101ac7:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101acb:	7e 0d                	jle    101ada <trapname+0x2e>
  101acd:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ad1:	7f 07                	jg     101ada <trapname+0x2e>
        return "Hardware Interrupt";
  101ad3:	b8 1f 3a 10 00       	mov    $0x103a1f,%eax
  101ad8:	eb 05                	jmp    101adf <trapname+0x33>
    }
    return "(unknown trap)";
  101ada:	b8 32 3a 10 00       	mov    $0x103a32,%eax
}
  101adf:	5d                   	pop    %ebp
  101ae0:	c3                   	ret    

00101ae1 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101ae1:	f3 0f 1e fb          	endbr32 
  101ae5:	55                   	push   %ebp
  101ae6:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101ae8:	8b 45 08             	mov    0x8(%ebp),%eax
  101aeb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101aef:	66 83 f8 08          	cmp    $0x8,%ax
  101af3:	0f 94 c0             	sete   %al
  101af6:	0f b6 c0             	movzbl %al,%eax
}
  101af9:	5d                   	pop    %ebp
  101afa:	c3                   	ret    

00101afb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101afb:	f3 0f 1e fb          	endbr32 
  101aff:	55                   	push   %ebp
  101b00:	89 e5                	mov    %esp,%ebp
  101b02:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101b05:	83 ec 08             	sub    $0x8,%esp
  101b08:	ff 75 08             	pushl  0x8(%ebp)
  101b0b:	68 73 3a 10 00       	push   $0x103a73
  101b10:	e8 60 e7 ff ff       	call   100275 <cprintf>
  101b15:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101b18:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1b:	83 ec 0c             	sub    $0xc,%esp
  101b1e:	50                   	push   %eax
  101b1f:	e8 b4 01 00 00       	call   101cd8 <print_regs>
  101b24:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b27:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2a:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b2e:	0f b7 c0             	movzwl %ax,%eax
  101b31:	83 ec 08             	sub    $0x8,%esp
  101b34:	50                   	push   %eax
  101b35:	68 84 3a 10 00       	push   $0x103a84
  101b3a:	e8 36 e7 ff ff       	call   100275 <cprintf>
  101b3f:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b42:	8b 45 08             	mov    0x8(%ebp),%eax
  101b45:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b49:	0f b7 c0             	movzwl %ax,%eax
  101b4c:	83 ec 08             	sub    $0x8,%esp
  101b4f:	50                   	push   %eax
  101b50:	68 97 3a 10 00       	push   $0x103a97
  101b55:	e8 1b e7 ff ff       	call   100275 <cprintf>
  101b5a:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b5d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b60:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b64:	0f b7 c0             	movzwl %ax,%eax
  101b67:	83 ec 08             	sub    $0x8,%esp
  101b6a:	50                   	push   %eax
  101b6b:	68 aa 3a 10 00       	push   $0x103aaa
  101b70:	e8 00 e7 ff ff       	call   100275 <cprintf>
  101b75:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b78:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7b:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b7f:	0f b7 c0             	movzwl %ax,%eax
  101b82:	83 ec 08             	sub    $0x8,%esp
  101b85:	50                   	push   %eax
  101b86:	68 bd 3a 10 00       	push   $0x103abd
  101b8b:	e8 e5 e6 ff ff       	call   100275 <cprintf>
  101b90:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b93:	8b 45 08             	mov    0x8(%ebp),%eax
  101b96:	8b 40 30             	mov    0x30(%eax),%eax
  101b99:	83 ec 0c             	sub    $0xc,%esp
  101b9c:	50                   	push   %eax
  101b9d:	e8 0a ff ff ff       	call   101aac <trapname>
  101ba2:	83 c4 10             	add    $0x10,%esp
  101ba5:	8b 55 08             	mov    0x8(%ebp),%edx
  101ba8:	8b 52 30             	mov    0x30(%edx),%edx
  101bab:	83 ec 04             	sub    $0x4,%esp
  101bae:	50                   	push   %eax
  101baf:	52                   	push   %edx
  101bb0:	68 d0 3a 10 00       	push   $0x103ad0
  101bb5:	e8 bb e6 ff ff       	call   100275 <cprintf>
  101bba:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101bbd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc0:	8b 40 34             	mov    0x34(%eax),%eax
  101bc3:	83 ec 08             	sub    $0x8,%esp
  101bc6:	50                   	push   %eax
  101bc7:	68 e2 3a 10 00       	push   $0x103ae2
  101bcc:	e8 a4 e6 ff ff       	call   100275 <cprintf>
  101bd1:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101bd4:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd7:	8b 40 38             	mov    0x38(%eax),%eax
  101bda:	83 ec 08             	sub    $0x8,%esp
  101bdd:	50                   	push   %eax
  101bde:	68 f1 3a 10 00       	push   $0x103af1
  101be3:	e8 8d e6 ff ff       	call   100275 <cprintf>
  101be8:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101beb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bee:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bf2:	0f b7 c0             	movzwl %ax,%eax
  101bf5:	83 ec 08             	sub    $0x8,%esp
  101bf8:	50                   	push   %eax
  101bf9:	68 00 3b 10 00       	push   $0x103b00
  101bfe:	e8 72 e6 ff ff       	call   100275 <cprintf>
  101c03:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101c06:	8b 45 08             	mov    0x8(%ebp),%eax
  101c09:	8b 40 40             	mov    0x40(%eax),%eax
  101c0c:	83 ec 08             	sub    $0x8,%esp
  101c0f:	50                   	push   %eax
  101c10:	68 13 3b 10 00       	push   $0x103b13
  101c15:	e8 5b e6 ff ff       	call   100275 <cprintf>
  101c1a:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c1d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101c24:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101c2b:	eb 3f                	jmp    101c6c <print_trapframe+0x171>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101c2d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c30:	8b 50 40             	mov    0x40(%eax),%edx
  101c33:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c36:	21 d0                	and    %edx,%eax
  101c38:	85 c0                	test   %eax,%eax
  101c3a:	74 29                	je     101c65 <print_trapframe+0x16a>
  101c3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c3f:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c46:	85 c0                	test   %eax,%eax
  101c48:	74 1b                	je     101c65 <print_trapframe+0x16a>
            cprintf("%s,", IA32flags[i]);
  101c4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c4d:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c54:	83 ec 08             	sub    $0x8,%esp
  101c57:	50                   	push   %eax
  101c58:	68 22 3b 10 00       	push   $0x103b22
  101c5d:	e8 13 e6 ff ff       	call   100275 <cprintf>
  101c62:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101c69:	d1 65 f0             	shll   -0x10(%ebp)
  101c6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c6f:	83 f8 17             	cmp    $0x17,%eax
  101c72:	76 b9                	jbe    101c2d <print_trapframe+0x132>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c74:	8b 45 08             	mov    0x8(%ebp),%eax
  101c77:	8b 40 40             	mov    0x40(%eax),%eax
  101c7a:	c1 e8 0c             	shr    $0xc,%eax
  101c7d:	83 e0 03             	and    $0x3,%eax
  101c80:	83 ec 08             	sub    $0x8,%esp
  101c83:	50                   	push   %eax
  101c84:	68 26 3b 10 00       	push   $0x103b26
  101c89:	e8 e7 e5 ff ff       	call   100275 <cprintf>
  101c8e:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101c91:	83 ec 0c             	sub    $0xc,%esp
  101c94:	ff 75 08             	pushl  0x8(%ebp)
  101c97:	e8 45 fe ff ff       	call   101ae1 <trap_in_kernel>
  101c9c:	83 c4 10             	add    $0x10,%esp
  101c9f:	85 c0                	test   %eax,%eax
  101ca1:	75 32                	jne    101cd5 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101ca3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca6:	8b 40 44             	mov    0x44(%eax),%eax
  101ca9:	83 ec 08             	sub    $0x8,%esp
  101cac:	50                   	push   %eax
  101cad:	68 2f 3b 10 00       	push   $0x103b2f
  101cb2:	e8 be e5 ff ff       	call   100275 <cprintf>
  101cb7:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101cba:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbd:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101cc1:	0f b7 c0             	movzwl %ax,%eax
  101cc4:	83 ec 08             	sub    $0x8,%esp
  101cc7:	50                   	push   %eax
  101cc8:	68 3e 3b 10 00       	push   $0x103b3e
  101ccd:	e8 a3 e5 ff ff       	call   100275 <cprintf>
  101cd2:	83 c4 10             	add    $0x10,%esp
    }
}
  101cd5:	90                   	nop
  101cd6:	c9                   	leave  
  101cd7:	c3                   	ret    

00101cd8 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101cd8:	f3 0f 1e fb          	endbr32 
  101cdc:	55                   	push   %ebp
  101cdd:	89 e5                	mov    %esp,%ebp
  101cdf:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ce2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce5:	8b 00                	mov    (%eax),%eax
  101ce7:	83 ec 08             	sub    $0x8,%esp
  101cea:	50                   	push   %eax
  101ceb:	68 51 3b 10 00       	push   $0x103b51
  101cf0:	e8 80 e5 ff ff       	call   100275 <cprintf>
  101cf5:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101cf8:	8b 45 08             	mov    0x8(%ebp),%eax
  101cfb:	8b 40 04             	mov    0x4(%eax),%eax
  101cfe:	83 ec 08             	sub    $0x8,%esp
  101d01:	50                   	push   %eax
  101d02:	68 60 3b 10 00       	push   $0x103b60
  101d07:	e8 69 e5 ff ff       	call   100275 <cprintf>
  101d0c:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101d0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d12:	8b 40 08             	mov    0x8(%eax),%eax
  101d15:	83 ec 08             	sub    $0x8,%esp
  101d18:	50                   	push   %eax
  101d19:	68 6f 3b 10 00       	push   $0x103b6f
  101d1e:	e8 52 e5 ff ff       	call   100275 <cprintf>
  101d23:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101d26:	8b 45 08             	mov    0x8(%ebp),%eax
  101d29:	8b 40 0c             	mov    0xc(%eax),%eax
  101d2c:	83 ec 08             	sub    $0x8,%esp
  101d2f:	50                   	push   %eax
  101d30:	68 7e 3b 10 00       	push   $0x103b7e
  101d35:	e8 3b e5 ff ff       	call   100275 <cprintf>
  101d3a:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d40:	8b 40 10             	mov    0x10(%eax),%eax
  101d43:	83 ec 08             	sub    $0x8,%esp
  101d46:	50                   	push   %eax
  101d47:	68 8d 3b 10 00       	push   $0x103b8d
  101d4c:	e8 24 e5 ff ff       	call   100275 <cprintf>
  101d51:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d54:	8b 45 08             	mov    0x8(%ebp),%eax
  101d57:	8b 40 14             	mov    0x14(%eax),%eax
  101d5a:	83 ec 08             	sub    $0x8,%esp
  101d5d:	50                   	push   %eax
  101d5e:	68 9c 3b 10 00       	push   $0x103b9c
  101d63:	e8 0d e5 ff ff       	call   100275 <cprintf>
  101d68:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d6b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d6e:	8b 40 18             	mov    0x18(%eax),%eax
  101d71:	83 ec 08             	sub    $0x8,%esp
  101d74:	50                   	push   %eax
  101d75:	68 ab 3b 10 00       	push   $0x103bab
  101d7a:	e8 f6 e4 ff ff       	call   100275 <cprintf>
  101d7f:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d82:	8b 45 08             	mov    0x8(%ebp),%eax
  101d85:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d88:	83 ec 08             	sub    $0x8,%esp
  101d8b:	50                   	push   %eax
  101d8c:	68 ba 3b 10 00       	push   $0x103bba
  101d91:	e8 df e4 ff ff       	call   100275 <cprintf>
  101d96:	83 c4 10             	add    $0x10,%esp
}
  101d99:	90                   	nop
  101d9a:	c9                   	leave  
  101d9b:	c3                   	ret    

00101d9c <trap_dispatch>:
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d9c:	f3 0f 1e fb          	endbr32 
  101da0:	55                   	push   %ebp
  101da1:	89 e5                	mov    %esp,%ebp
  101da3:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101da6:	8b 45 08             	mov    0x8(%ebp),%eax
  101da9:	8b 40 30             	mov    0x30(%eax),%eax
  101dac:	83 f8 79             	cmp    $0x79,%eax
  101daf:	0f 84 24 01 00 00    	je     101ed9 <trap_dispatch+0x13d>
  101db5:	83 f8 79             	cmp    $0x79,%eax
  101db8:	0f 87 5b 01 00 00    	ja     101f19 <trap_dispatch+0x17d>
  101dbe:	83 f8 78             	cmp    $0x78,%eax
  101dc1:	0f 84 c0 00 00 00    	je     101e87 <trap_dispatch+0xeb>
  101dc7:	83 f8 78             	cmp    $0x78,%eax
  101dca:	0f 87 49 01 00 00    	ja     101f19 <trap_dispatch+0x17d>
  101dd0:	83 f8 2f             	cmp    $0x2f,%eax
  101dd3:	0f 87 40 01 00 00    	ja     101f19 <trap_dispatch+0x17d>
  101dd9:	83 f8 2e             	cmp    $0x2e,%eax
  101ddc:	0f 83 6d 01 00 00    	jae    101f4f <trap_dispatch+0x1b3>
  101de2:	83 f8 24             	cmp    $0x24,%eax
  101de5:	74 52                	je     101e39 <trap_dispatch+0x9d>
  101de7:	83 f8 24             	cmp    $0x24,%eax
  101dea:	0f 87 29 01 00 00    	ja     101f19 <trap_dispatch+0x17d>
  101df0:	83 f8 20             	cmp    $0x20,%eax
  101df3:	74 0a                	je     101dff <trap_dispatch+0x63>
  101df5:	83 f8 21             	cmp    $0x21,%eax
  101df8:	74 66                	je     101e60 <trap_dispatch+0xc4>
  101dfa:	e9 1a 01 00 00       	jmp    101f19 <trap_dispatch+0x17d>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101dff:	a1 08 09 11 00       	mov    0x110908,%eax
  101e04:	83 c0 01             	add    $0x1,%eax
  101e07:	a3 08 09 11 00       	mov    %eax,0x110908
        if (ticks % TICK_NUM == 0) {
  101e0c:	8b 0d 08 09 11 00    	mov    0x110908,%ecx
  101e12:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101e17:	89 c8                	mov    %ecx,%eax
  101e19:	f7 e2                	mul    %edx
  101e1b:	89 d0                	mov    %edx,%eax
  101e1d:	c1 e8 05             	shr    $0x5,%eax
  101e20:	6b c0 64             	imul   $0x64,%eax,%eax
  101e23:	29 c1                	sub    %eax,%ecx
  101e25:	89 c8                	mov    %ecx,%eax
  101e27:	85 c0                	test   %eax,%eax
  101e29:	0f 85 23 01 00 00    	jne    101f52 <trap_dispatch+0x1b6>
            print_ticks();
  101e2f:	e8 c1 fa ff ff       	call   1018f5 <print_ticks>
        }
        break;
  101e34:	e9 19 01 00 00       	jmp    101f52 <trap_dispatch+0x1b6>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101e39:	e8 60 f8 ff ff       	call   10169e <cons_getc>
  101e3e:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101e41:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e45:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e49:	83 ec 04             	sub    $0x4,%esp
  101e4c:	52                   	push   %edx
  101e4d:	50                   	push   %eax
  101e4e:	68 c9 3b 10 00       	push   $0x103bc9
  101e53:	e8 1d e4 ff ff       	call   100275 <cprintf>
  101e58:	83 c4 10             	add    $0x10,%esp
        break;
  101e5b:	e9 f9 00 00 00       	jmp    101f59 <trap_dispatch+0x1bd>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101e60:	e8 39 f8 ff ff       	call   10169e <cons_getc>
  101e65:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101e68:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e6c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e70:	83 ec 04             	sub    $0x4,%esp
  101e73:	52                   	push   %edx
  101e74:	50                   	push   %eax
  101e75:	68 db 3b 10 00       	push   $0x103bdb
  101e7a:	e8 f6 e3 ff ff       	call   100275 <cprintf>
  101e7f:	83 c4 10             	add    $0x10,%esp
        break;
  101e82:	e9 d2 00 00 00       	jmp    101f59 <trap_dispatch+0x1bd>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101e87:	8b 45 08             	mov    0x8(%ebp),%eax
  101e8a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e8e:	66 83 f8 1b          	cmp    $0x1b,%ax
  101e92:	0f 84 bd 00 00 00    	je     101f55 <trap_dispatch+0x1b9>
            tf->tf_cs = USER_CS;
  101e98:	8b 45 08             	mov    0x8(%ebp),%eax
  101e9b:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
            tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
  101ea1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea4:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  101eaa:	8b 45 08             	mov    0x8(%ebp),%eax
  101ead:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  101eb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb4:	66 89 50 28          	mov    %dx,0x28(%eax)
  101eb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101ebb:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101ebf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec2:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags |= FL_IOPL_MASK;
  101ec6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec9:	8b 40 40             	mov    0x40(%eax),%eax
  101ecc:	80 cc 30             	or     $0x30,%ah
  101ecf:	89 c2                	mov    %eax,%edx
  101ed1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ed4:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101ed7:	eb 7c                	jmp    101f55 <trap_dispatch+0x1b9>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101ed9:	8b 45 08             	mov    0x8(%ebp),%eax
  101edc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ee0:	66 83 f8 08          	cmp    $0x8,%ax
  101ee4:	74 72                	je     101f58 <trap_dispatch+0x1bc>
            tf->tf_cs = KERNEL_CS;
  101ee6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ee9:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101eef:	8b 45 08             	mov    0x8(%ebp),%eax
  101ef2:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
  101efb:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101eff:	8b 45 08             	mov    0x8(%ebp),%eax
  101f02:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101f06:	8b 45 08             	mov    0x8(%ebp),%eax
  101f09:	8b 40 40             	mov    0x40(%eax),%eax
  101f0c:	80 e4 cf             	and    $0xcf,%ah
  101f0f:	89 c2                	mov    %eax,%edx
  101f11:	8b 45 08             	mov    0x8(%ebp),%eax
  101f14:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101f17:	eb 3f                	jmp    101f58 <trap_dispatch+0x1bc>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101f19:	8b 45 08             	mov    0x8(%ebp),%eax
  101f1c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f20:	0f b7 c0             	movzwl %ax,%eax
  101f23:	83 e0 03             	and    $0x3,%eax
  101f26:	85 c0                	test   %eax,%eax
  101f28:	75 2f                	jne    101f59 <trap_dispatch+0x1bd>
            print_trapframe(tf);
  101f2a:	83 ec 0c             	sub    $0xc,%esp
  101f2d:	ff 75 08             	pushl  0x8(%ebp)
  101f30:	e8 c6 fb ff ff       	call   101afb <print_trapframe>
  101f35:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101f38:	83 ec 04             	sub    $0x4,%esp
  101f3b:	68 ea 3b 10 00       	push   $0x103bea
  101f40:	68 c8 00 00 00       	push   $0xc8
  101f45:	68 0e 3a 10 00       	push   $0x103a0e
  101f4a:	e8 a1 e4 ff ff       	call   1003f0 <__panic>
        break;
  101f4f:	90                   	nop
  101f50:	eb 07                	jmp    101f59 <trap_dispatch+0x1bd>
        break;
  101f52:	90                   	nop
  101f53:	eb 04                	jmp    101f59 <trap_dispatch+0x1bd>
        break;
  101f55:	90                   	nop
  101f56:	eb 01                	jmp    101f59 <trap_dispatch+0x1bd>
        break;
  101f58:	90                   	nop
        }
    }
}
  101f59:	90                   	nop
  101f5a:	c9                   	leave  
  101f5b:	c3                   	ret    

00101f5c <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101f5c:	f3 0f 1e fb          	endbr32 
  101f60:	55                   	push   %ebp
  101f61:	89 e5                	mov    %esp,%ebp
  101f63:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101f66:	83 ec 0c             	sub    $0xc,%esp
  101f69:	ff 75 08             	pushl  0x8(%ebp)
  101f6c:	e8 2b fe ff ff       	call   101d9c <trap_dispatch>
  101f71:	83 c4 10             	add    $0x10,%esp
}
  101f74:	90                   	nop
  101f75:	c9                   	leave  
  101f76:	c3                   	ret    

00101f77 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101f77:	6a 00                	push   $0x0
  pushl $0
  101f79:	6a 00                	push   $0x0
  jmp __alltraps
  101f7b:	e9 67 0a 00 00       	jmp    1029e7 <__alltraps>

00101f80 <vector1>:
.globl vector1
vector1:
  pushl $0
  101f80:	6a 00                	push   $0x0
  pushl $1
  101f82:	6a 01                	push   $0x1
  jmp __alltraps
  101f84:	e9 5e 0a 00 00       	jmp    1029e7 <__alltraps>

00101f89 <vector2>:
.globl vector2
vector2:
  pushl $0
  101f89:	6a 00                	push   $0x0
  pushl $2
  101f8b:	6a 02                	push   $0x2
  jmp __alltraps
  101f8d:	e9 55 0a 00 00       	jmp    1029e7 <__alltraps>

00101f92 <vector3>:
.globl vector3
vector3:
  pushl $0
  101f92:	6a 00                	push   $0x0
  pushl $3
  101f94:	6a 03                	push   $0x3
  jmp __alltraps
  101f96:	e9 4c 0a 00 00       	jmp    1029e7 <__alltraps>

00101f9b <vector4>:
.globl vector4
vector4:
  pushl $0
  101f9b:	6a 00                	push   $0x0
  pushl $4
  101f9d:	6a 04                	push   $0x4
  jmp __alltraps
  101f9f:	e9 43 0a 00 00       	jmp    1029e7 <__alltraps>

00101fa4 <vector5>:
.globl vector5
vector5:
  pushl $0
  101fa4:	6a 00                	push   $0x0
  pushl $5
  101fa6:	6a 05                	push   $0x5
  jmp __alltraps
  101fa8:	e9 3a 0a 00 00       	jmp    1029e7 <__alltraps>

00101fad <vector6>:
.globl vector6
vector6:
  pushl $0
  101fad:	6a 00                	push   $0x0
  pushl $6
  101faf:	6a 06                	push   $0x6
  jmp __alltraps
  101fb1:	e9 31 0a 00 00       	jmp    1029e7 <__alltraps>

00101fb6 <vector7>:
.globl vector7
vector7:
  pushl $0
  101fb6:	6a 00                	push   $0x0
  pushl $7
  101fb8:	6a 07                	push   $0x7
  jmp __alltraps
  101fba:	e9 28 0a 00 00       	jmp    1029e7 <__alltraps>

00101fbf <vector8>:
.globl vector8
vector8:
  pushl $8
  101fbf:	6a 08                	push   $0x8
  jmp __alltraps
  101fc1:	e9 21 0a 00 00       	jmp    1029e7 <__alltraps>

00101fc6 <vector9>:
.globl vector9
vector9:
  pushl $9
  101fc6:	6a 09                	push   $0x9
  jmp __alltraps
  101fc8:	e9 1a 0a 00 00       	jmp    1029e7 <__alltraps>

00101fcd <vector10>:
.globl vector10
vector10:
  pushl $10
  101fcd:	6a 0a                	push   $0xa
  jmp __alltraps
  101fcf:	e9 13 0a 00 00       	jmp    1029e7 <__alltraps>

00101fd4 <vector11>:
.globl vector11
vector11:
  pushl $11
  101fd4:	6a 0b                	push   $0xb
  jmp __alltraps
  101fd6:	e9 0c 0a 00 00       	jmp    1029e7 <__alltraps>

00101fdb <vector12>:
.globl vector12
vector12:
  pushl $12
  101fdb:	6a 0c                	push   $0xc
  jmp __alltraps
  101fdd:	e9 05 0a 00 00       	jmp    1029e7 <__alltraps>

00101fe2 <vector13>:
.globl vector13
vector13:
  pushl $13
  101fe2:	6a 0d                	push   $0xd
  jmp __alltraps
  101fe4:	e9 fe 09 00 00       	jmp    1029e7 <__alltraps>

00101fe9 <vector14>:
.globl vector14
vector14:
  pushl $14
  101fe9:	6a 0e                	push   $0xe
  jmp __alltraps
  101feb:	e9 f7 09 00 00       	jmp    1029e7 <__alltraps>

00101ff0 <vector15>:
.globl vector15
vector15:
  pushl $0
  101ff0:	6a 00                	push   $0x0
  pushl $15
  101ff2:	6a 0f                	push   $0xf
  jmp __alltraps
  101ff4:	e9 ee 09 00 00       	jmp    1029e7 <__alltraps>

00101ff9 <vector16>:
.globl vector16
vector16:
  pushl $0
  101ff9:	6a 00                	push   $0x0
  pushl $16
  101ffb:	6a 10                	push   $0x10
  jmp __alltraps
  101ffd:	e9 e5 09 00 00       	jmp    1029e7 <__alltraps>

00102002 <vector17>:
.globl vector17
vector17:
  pushl $17
  102002:	6a 11                	push   $0x11
  jmp __alltraps
  102004:	e9 de 09 00 00       	jmp    1029e7 <__alltraps>

00102009 <vector18>:
.globl vector18
vector18:
  pushl $0
  102009:	6a 00                	push   $0x0
  pushl $18
  10200b:	6a 12                	push   $0x12
  jmp __alltraps
  10200d:	e9 d5 09 00 00       	jmp    1029e7 <__alltraps>

00102012 <vector19>:
.globl vector19
vector19:
  pushl $0
  102012:	6a 00                	push   $0x0
  pushl $19
  102014:	6a 13                	push   $0x13
  jmp __alltraps
  102016:	e9 cc 09 00 00       	jmp    1029e7 <__alltraps>

0010201b <vector20>:
.globl vector20
vector20:
  pushl $0
  10201b:	6a 00                	push   $0x0
  pushl $20
  10201d:	6a 14                	push   $0x14
  jmp __alltraps
  10201f:	e9 c3 09 00 00       	jmp    1029e7 <__alltraps>

00102024 <vector21>:
.globl vector21
vector21:
  pushl $0
  102024:	6a 00                	push   $0x0
  pushl $21
  102026:	6a 15                	push   $0x15
  jmp __alltraps
  102028:	e9 ba 09 00 00       	jmp    1029e7 <__alltraps>

0010202d <vector22>:
.globl vector22
vector22:
  pushl $0
  10202d:	6a 00                	push   $0x0
  pushl $22
  10202f:	6a 16                	push   $0x16
  jmp __alltraps
  102031:	e9 b1 09 00 00       	jmp    1029e7 <__alltraps>

00102036 <vector23>:
.globl vector23
vector23:
  pushl $0
  102036:	6a 00                	push   $0x0
  pushl $23
  102038:	6a 17                	push   $0x17
  jmp __alltraps
  10203a:	e9 a8 09 00 00       	jmp    1029e7 <__alltraps>

0010203f <vector24>:
.globl vector24
vector24:
  pushl $0
  10203f:	6a 00                	push   $0x0
  pushl $24
  102041:	6a 18                	push   $0x18
  jmp __alltraps
  102043:	e9 9f 09 00 00       	jmp    1029e7 <__alltraps>

00102048 <vector25>:
.globl vector25
vector25:
  pushl $0
  102048:	6a 00                	push   $0x0
  pushl $25
  10204a:	6a 19                	push   $0x19
  jmp __alltraps
  10204c:	e9 96 09 00 00       	jmp    1029e7 <__alltraps>

00102051 <vector26>:
.globl vector26
vector26:
  pushl $0
  102051:	6a 00                	push   $0x0
  pushl $26
  102053:	6a 1a                	push   $0x1a
  jmp __alltraps
  102055:	e9 8d 09 00 00       	jmp    1029e7 <__alltraps>

0010205a <vector27>:
.globl vector27
vector27:
  pushl $0
  10205a:	6a 00                	push   $0x0
  pushl $27
  10205c:	6a 1b                	push   $0x1b
  jmp __alltraps
  10205e:	e9 84 09 00 00       	jmp    1029e7 <__alltraps>

00102063 <vector28>:
.globl vector28
vector28:
  pushl $0
  102063:	6a 00                	push   $0x0
  pushl $28
  102065:	6a 1c                	push   $0x1c
  jmp __alltraps
  102067:	e9 7b 09 00 00       	jmp    1029e7 <__alltraps>

0010206c <vector29>:
.globl vector29
vector29:
  pushl $0
  10206c:	6a 00                	push   $0x0
  pushl $29
  10206e:	6a 1d                	push   $0x1d
  jmp __alltraps
  102070:	e9 72 09 00 00       	jmp    1029e7 <__alltraps>

00102075 <vector30>:
.globl vector30
vector30:
  pushl $0
  102075:	6a 00                	push   $0x0
  pushl $30
  102077:	6a 1e                	push   $0x1e
  jmp __alltraps
  102079:	e9 69 09 00 00       	jmp    1029e7 <__alltraps>

0010207e <vector31>:
.globl vector31
vector31:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $31
  102080:	6a 1f                	push   $0x1f
  jmp __alltraps
  102082:	e9 60 09 00 00       	jmp    1029e7 <__alltraps>

00102087 <vector32>:
.globl vector32
vector32:
  pushl $0
  102087:	6a 00                	push   $0x0
  pushl $32
  102089:	6a 20                	push   $0x20
  jmp __alltraps
  10208b:	e9 57 09 00 00       	jmp    1029e7 <__alltraps>

00102090 <vector33>:
.globl vector33
vector33:
  pushl $0
  102090:	6a 00                	push   $0x0
  pushl $33
  102092:	6a 21                	push   $0x21
  jmp __alltraps
  102094:	e9 4e 09 00 00       	jmp    1029e7 <__alltraps>

00102099 <vector34>:
.globl vector34
vector34:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $34
  10209b:	6a 22                	push   $0x22
  jmp __alltraps
  10209d:	e9 45 09 00 00       	jmp    1029e7 <__alltraps>

001020a2 <vector35>:
.globl vector35
vector35:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $35
  1020a4:	6a 23                	push   $0x23
  jmp __alltraps
  1020a6:	e9 3c 09 00 00       	jmp    1029e7 <__alltraps>

001020ab <vector36>:
.globl vector36
vector36:
  pushl $0
  1020ab:	6a 00                	push   $0x0
  pushl $36
  1020ad:	6a 24                	push   $0x24
  jmp __alltraps
  1020af:	e9 33 09 00 00       	jmp    1029e7 <__alltraps>

001020b4 <vector37>:
.globl vector37
vector37:
  pushl $0
  1020b4:	6a 00                	push   $0x0
  pushl $37
  1020b6:	6a 25                	push   $0x25
  jmp __alltraps
  1020b8:	e9 2a 09 00 00       	jmp    1029e7 <__alltraps>

001020bd <vector38>:
.globl vector38
vector38:
  pushl $0
  1020bd:	6a 00                	push   $0x0
  pushl $38
  1020bf:	6a 26                	push   $0x26
  jmp __alltraps
  1020c1:	e9 21 09 00 00       	jmp    1029e7 <__alltraps>

001020c6 <vector39>:
.globl vector39
vector39:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $39
  1020c8:	6a 27                	push   $0x27
  jmp __alltraps
  1020ca:	e9 18 09 00 00       	jmp    1029e7 <__alltraps>

001020cf <vector40>:
.globl vector40
vector40:
  pushl $0
  1020cf:	6a 00                	push   $0x0
  pushl $40
  1020d1:	6a 28                	push   $0x28
  jmp __alltraps
  1020d3:	e9 0f 09 00 00       	jmp    1029e7 <__alltraps>

001020d8 <vector41>:
.globl vector41
vector41:
  pushl $0
  1020d8:	6a 00                	push   $0x0
  pushl $41
  1020da:	6a 29                	push   $0x29
  jmp __alltraps
  1020dc:	e9 06 09 00 00       	jmp    1029e7 <__alltraps>

001020e1 <vector42>:
.globl vector42
vector42:
  pushl $0
  1020e1:	6a 00                	push   $0x0
  pushl $42
  1020e3:	6a 2a                	push   $0x2a
  jmp __alltraps
  1020e5:	e9 fd 08 00 00       	jmp    1029e7 <__alltraps>

001020ea <vector43>:
.globl vector43
vector43:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $43
  1020ec:	6a 2b                	push   $0x2b
  jmp __alltraps
  1020ee:	e9 f4 08 00 00       	jmp    1029e7 <__alltraps>

001020f3 <vector44>:
.globl vector44
vector44:
  pushl $0
  1020f3:	6a 00                	push   $0x0
  pushl $44
  1020f5:	6a 2c                	push   $0x2c
  jmp __alltraps
  1020f7:	e9 eb 08 00 00       	jmp    1029e7 <__alltraps>

001020fc <vector45>:
.globl vector45
vector45:
  pushl $0
  1020fc:	6a 00                	push   $0x0
  pushl $45
  1020fe:	6a 2d                	push   $0x2d
  jmp __alltraps
  102100:	e9 e2 08 00 00       	jmp    1029e7 <__alltraps>

00102105 <vector46>:
.globl vector46
vector46:
  pushl $0
  102105:	6a 00                	push   $0x0
  pushl $46
  102107:	6a 2e                	push   $0x2e
  jmp __alltraps
  102109:	e9 d9 08 00 00       	jmp    1029e7 <__alltraps>

0010210e <vector47>:
.globl vector47
vector47:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $47
  102110:	6a 2f                	push   $0x2f
  jmp __alltraps
  102112:	e9 d0 08 00 00       	jmp    1029e7 <__alltraps>

00102117 <vector48>:
.globl vector48
vector48:
  pushl $0
  102117:	6a 00                	push   $0x0
  pushl $48
  102119:	6a 30                	push   $0x30
  jmp __alltraps
  10211b:	e9 c7 08 00 00       	jmp    1029e7 <__alltraps>

00102120 <vector49>:
.globl vector49
vector49:
  pushl $0
  102120:	6a 00                	push   $0x0
  pushl $49
  102122:	6a 31                	push   $0x31
  jmp __alltraps
  102124:	e9 be 08 00 00       	jmp    1029e7 <__alltraps>

00102129 <vector50>:
.globl vector50
vector50:
  pushl $0
  102129:	6a 00                	push   $0x0
  pushl $50
  10212b:	6a 32                	push   $0x32
  jmp __alltraps
  10212d:	e9 b5 08 00 00       	jmp    1029e7 <__alltraps>

00102132 <vector51>:
.globl vector51
vector51:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $51
  102134:	6a 33                	push   $0x33
  jmp __alltraps
  102136:	e9 ac 08 00 00       	jmp    1029e7 <__alltraps>

0010213b <vector52>:
.globl vector52
vector52:
  pushl $0
  10213b:	6a 00                	push   $0x0
  pushl $52
  10213d:	6a 34                	push   $0x34
  jmp __alltraps
  10213f:	e9 a3 08 00 00       	jmp    1029e7 <__alltraps>

00102144 <vector53>:
.globl vector53
vector53:
  pushl $0
  102144:	6a 00                	push   $0x0
  pushl $53
  102146:	6a 35                	push   $0x35
  jmp __alltraps
  102148:	e9 9a 08 00 00       	jmp    1029e7 <__alltraps>

0010214d <vector54>:
.globl vector54
vector54:
  pushl $0
  10214d:	6a 00                	push   $0x0
  pushl $54
  10214f:	6a 36                	push   $0x36
  jmp __alltraps
  102151:	e9 91 08 00 00       	jmp    1029e7 <__alltraps>

00102156 <vector55>:
.globl vector55
vector55:
  pushl $0
  102156:	6a 00                	push   $0x0
  pushl $55
  102158:	6a 37                	push   $0x37
  jmp __alltraps
  10215a:	e9 88 08 00 00       	jmp    1029e7 <__alltraps>

0010215f <vector56>:
.globl vector56
vector56:
  pushl $0
  10215f:	6a 00                	push   $0x0
  pushl $56
  102161:	6a 38                	push   $0x38
  jmp __alltraps
  102163:	e9 7f 08 00 00       	jmp    1029e7 <__alltraps>

00102168 <vector57>:
.globl vector57
vector57:
  pushl $0
  102168:	6a 00                	push   $0x0
  pushl $57
  10216a:	6a 39                	push   $0x39
  jmp __alltraps
  10216c:	e9 76 08 00 00       	jmp    1029e7 <__alltraps>

00102171 <vector58>:
.globl vector58
vector58:
  pushl $0
  102171:	6a 00                	push   $0x0
  pushl $58
  102173:	6a 3a                	push   $0x3a
  jmp __alltraps
  102175:	e9 6d 08 00 00       	jmp    1029e7 <__alltraps>

0010217a <vector59>:
.globl vector59
vector59:
  pushl $0
  10217a:	6a 00                	push   $0x0
  pushl $59
  10217c:	6a 3b                	push   $0x3b
  jmp __alltraps
  10217e:	e9 64 08 00 00       	jmp    1029e7 <__alltraps>

00102183 <vector60>:
.globl vector60
vector60:
  pushl $0
  102183:	6a 00                	push   $0x0
  pushl $60
  102185:	6a 3c                	push   $0x3c
  jmp __alltraps
  102187:	e9 5b 08 00 00       	jmp    1029e7 <__alltraps>

0010218c <vector61>:
.globl vector61
vector61:
  pushl $0
  10218c:	6a 00                	push   $0x0
  pushl $61
  10218e:	6a 3d                	push   $0x3d
  jmp __alltraps
  102190:	e9 52 08 00 00       	jmp    1029e7 <__alltraps>

00102195 <vector62>:
.globl vector62
vector62:
  pushl $0
  102195:	6a 00                	push   $0x0
  pushl $62
  102197:	6a 3e                	push   $0x3e
  jmp __alltraps
  102199:	e9 49 08 00 00       	jmp    1029e7 <__alltraps>

0010219e <vector63>:
.globl vector63
vector63:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $63
  1021a0:	6a 3f                	push   $0x3f
  jmp __alltraps
  1021a2:	e9 40 08 00 00       	jmp    1029e7 <__alltraps>

001021a7 <vector64>:
.globl vector64
vector64:
  pushl $0
  1021a7:	6a 00                	push   $0x0
  pushl $64
  1021a9:	6a 40                	push   $0x40
  jmp __alltraps
  1021ab:	e9 37 08 00 00       	jmp    1029e7 <__alltraps>

001021b0 <vector65>:
.globl vector65
vector65:
  pushl $0
  1021b0:	6a 00                	push   $0x0
  pushl $65
  1021b2:	6a 41                	push   $0x41
  jmp __alltraps
  1021b4:	e9 2e 08 00 00       	jmp    1029e7 <__alltraps>

001021b9 <vector66>:
.globl vector66
vector66:
  pushl $0
  1021b9:	6a 00                	push   $0x0
  pushl $66
  1021bb:	6a 42                	push   $0x42
  jmp __alltraps
  1021bd:	e9 25 08 00 00       	jmp    1029e7 <__alltraps>

001021c2 <vector67>:
.globl vector67
vector67:
  pushl $0
  1021c2:	6a 00                	push   $0x0
  pushl $67
  1021c4:	6a 43                	push   $0x43
  jmp __alltraps
  1021c6:	e9 1c 08 00 00       	jmp    1029e7 <__alltraps>

001021cb <vector68>:
.globl vector68
vector68:
  pushl $0
  1021cb:	6a 00                	push   $0x0
  pushl $68
  1021cd:	6a 44                	push   $0x44
  jmp __alltraps
  1021cf:	e9 13 08 00 00       	jmp    1029e7 <__alltraps>

001021d4 <vector69>:
.globl vector69
vector69:
  pushl $0
  1021d4:	6a 00                	push   $0x0
  pushl $69
  1021d6:	6a 45                	push   $0x45
  jmp __alltraps
  1021d8:	e9 0a 08 00 00       	jmp    1029e7 <__alltraps>

001021dd <vector70>:
.globl vector70
vector70:
  pushl $0
  1021dd:	6a 00                	push   $0x0
  pushl $70
  1021df:	6a 46                	push   $0x46
  jmp __alltraps
  1021e1:	e9 01 08 00 00       	jmp    1029e7 <__alltraps>

001021e6 <vector71>:
.globl vector71
vector71:
  pushl $0
  1021e6:	6a 00                	push   $0x0
  pushl $71
  1021e8:	6a 47                	push   $0x47
  jmp __alltraps
  1021ea:	e9 f8 07 00 00       	jmp    1029e7 <__alltraps>

001021ef <vector72>:
.globl vector72
vector72:
  pushl $0
  1021ef:	6a 00                	push   $0x0
  pushl $72
  1021f1:	6a 48                	push   $0x48
  jmp __alltraps
  1021f3:	e9 ef 07 00 00       	jmp    1029e7 <__alltraps>

001021f8 <vector73>:
.globl vector73
vector73:
  pushl $0
  1021f8:	6a 00                	push   $0x0
  pushl $73
  1021fa:	6a 49                	push   $0x49
  jmp __alltraps
  1021fc:	e9 e6 07 00 00       	jmp    1029e7 <__alltraps>

00102201 <vector74>:
.globl vector74
vector74:
  pushl $0
  102201:	6a 00                	push   $0x0
  pushl $74
  102203:	6a 4a                	push   $0x4a
  jmp __alltraps
  102205:	e9 dd 07 00 00       	jmp    1029e7 <__alltraps>

0010220a <vector75>:
.globl vector75
vector75:
  pushl $0
  10220a:	6a 00                	push   $0x0
  pushl $75
  10220c:	6a 4b                	push   $0x4b
  jmp __alltraps
  10220e:	e9 d4 07 00 00       	jmp    1029e7 <__alltraps>

00102213 <vector76>:
.globl vector76
vector76:
  pushl $0
  102213:	6a 00                	push   $0x0
  pushl $76
  102215:	6a 4c                	push   $0x4c
  jmp __alltraps
  102217:	e9 cb 07 00 00       	jmp    1029e7 <__alltraps>

0010221c <vector77>:
.globl vector77
vector77:
  pushl $0
  10221c:	6a 00                	push   $0x0
  pushl $77
  10221e:	6a 4d                	push   $0x4d
  jmp __alltraps
  102220:	e9 c2 07 00 00       	jmp    1029e7 <__alltraps>

00102225 <vector78>:
.globl vector78
vector78:
  pushl $0
  102225:	6a 00                	push   $0x0
  pushl $78
  102227:	6a 4e                	push   $0x4e
  jmp __alltraps
  102229:	e9 b9 07 00 00       	jmp    1029e7 <__alltraps>

0010222e <vector79>:
.globl vector79
vector79:
  pushl $0
  10222e:	6a 00                	push   $0x0
  pushl $79
  102230:	6a 4f                	push   $0x4f
  jmp __alltraps
  102232:	e9 b0 07 00 00       	jmp    1029e7 <__alltraps>

00102237 <vector80>:
.globl vector80
vector80:
  pushl $0
  102237:	6a 00                	push   $0x0
  pushl $80
  102239:	6a 50                	push   $0x50
  jmp __alltraps
  10223b:	e9 a7 07 00 00       	jmp    1029e7 <__alltraps>

00102240 <vector81>:
.globl vector81
vector81:
  pushl $0
  102240:	6a 00                	push   $0x0
  pushl $81
  102242:	6a 51                	push   $0x51
  jmp __alltraps
  102244:	e9 9e 07 00 00       	jmp    1029e7 <__alltraps>

00102249 <vector82>:
.globl vector82
vector82:
  pushl $0
  102249:	6a 00                	push   $0x0
  pushl $82
  10224b:	6a 52                	push   $0x52
  jmp __alltraps
  10224d:	e9 95 07 00 00       	jmp    1029e7 <__alltraps>

00102252 <vector83>:
.globl vector83
vector83:
  pushl $0
  102252:	6a 00                	push   $0x0
  pushl $83
  102254:	6a 53                	push   $0x53
  jmp __alltraps
  102256:	e9 8c 07 00 00       	jmp    1029e7 <__alltraps>

0010225b <vector84>:
.globl vector84
vector84:
  pushl $0
  10225b:	6a 00                	push   $0x0
  pushl $84
  10225d:	6a 54                	push   $0x54
  jmp __alltraps
  10225f:	e9 83 07 00 00       	jmp    1029e7 <__alltraps>

00102264 <vector85>:
.globl vector85
vector85:
  pushl $0
  102264:	6a 00                	push   $0x0
  pushl $85
  102266:	6a 55                	push   $0x55
  jmp __alltraps
  102268:	e9 7a 07 00 00       	jmp    1029e7 <__alltraps>

0010226d <vector86>:
.globl vector86
vector86:
  pushl $0
  10226d:	6a 00                	push   $0x0
  pushl $86
  10226f:	6a 56                	push   $0x56
  jmp __alltraps
  102271:	e9 71 07 00 00       	jmp    1029e7 <__alltraps>

00102276 <vector87>:
.globl vector87
vector87:
  pushl $0
  102276:	6a 00                	push   $0x0
  pushl $87
  102278:	6a 57                	push   $0x57
  jmp __alltraps
  10227a:	e9 68 07 00 00       	jmp    1029e7 <__alltraps>

0010227f <vector88>:
.globl vector88
vector88:
  pushl $0
  10227f:	6a 00                	push   $0x0
  pushl $88
  102281:	6a 58                	push   $0x58
  jmp __alltraps
  102283:	e9 5f 07 00 00       	jmp    1029e7 <__alltraps>

00102288 <vector89>:
.globl vector89
vector89:
  pushl $0
  102288:	6a 00                	push   $0x0
  pushl $89
  10228a:	6a 59                	push   $0x59
  jmp __alltraps
  10228c:	e9 56 07 00 00       	jmp    1029e7 <__alltraps>

00102291 <vector90>:
.globl vector90
vector90:
  pushl $0
  102291:	6a 00                	push   $0x0
  pushl $90
  102293:	6a 5a                	push   $0x5a
  jmp __alltraps
  102295:	e9 4d 07 00 00       	jmp    1029e7 <__alltraps>

0010229a <vector91>:
.globl vector91
vector91:
  pushl $0
  10229a:	6a 00                	push   $0x0
  pushl $91
  10229c:	6a 5b                	push   $0x5b
  jmp __alltraps
  10229e:	e9 44 07 00 00       	jmp    1029e7 <__alltraps>

001022a3 <vector92>:
.globl vector92
vector92:
  pushl $0
  1022a3:	6a 00                	push   $0x0
  pushl $92
  1022a5:	6a 5c                	push   $0x5c
  jmp __alltraps
  1022a7:	e9 3b 07 00 00       	jmp    1029e7 <__alltraps>

001022ac <vector93>:
.globl vector93
vector93:
  pushl $0
  1022ac:	6a 00                	push   $0x0
  pushl $93
  1022ae:	6a 5d                	push   $0x5d
  jmp __alltraps
  1022b0:	e9 32 07 00 00       	jmp    1029e7 <__alltraps>

001022b5 <vector94>:
.globl vector94
vector94:
  pushl $0
  1022b5:	6a 00                	push   $0x0
  pushl $94
  1022b7:	6a 5e                	push   $0x5e
  jmp __alltraps
  1022b9:	e9 29 07 00 00       	jmp    1029e7 <__alltraps>

001022be <vector95>:
.globl vector95
vector95:
  pushl $0
  1022be:	6a 00                	push   $0x0
  pushl $95
  1022c0:	6a 5f                	push   $0x5f
  jmp __alltraps
  1022c2:	e9 20 07 00 00       	jmp    1029e7 <__alltraps>

001022c7 <vector96>:
.globl vector96
vector96:
  pushl $0
  1022c7:	6a 00                	push   $0x0
  pushl $96
  1022c9:	6a 60                	push   $0x60
  jmp __alltraps
  1022cb:	e9 17 07 00 00       	jmp    1029e7 <__alltraps>

001022d0 <vector97>:
.globl vector97
vector97:
  pushl $0
  1022d0:	6a 00                	push   $0x0
  pushl $97
  1022d2:	6a 61                	push   $0x61
  jmp __alltraps
  1022d4:	e9 0e 07 00 00       	jmp    1029e7 <__alltraps>

001022d9 <vector98>:
.globl vector98
vector98:
  pushl $0
  1022d9:	6a 00                	push   $0x0
  pushl $98
  1022db:	6a 62                	push   $0x62
  jmp __alltraps
  1022dd:	e9 05 07 00 00       	jmp    1029e7 <__alltraps>

001022e2 <vector99>:
.globl vector99
vector99:
  pushl $0
  1022e2:	6a 00                	push   $0x0
  pushl $99
  1022e4:	6a 63                	push   $0x63
  jmp __alltraps
  1022e6:	e9 fc 06 00 00       	jmp    1029e7 <__alltraps>

001022eb <vector100>:
.globl vector100
vector100:
  pushl $0
  1022eb:	6a 00                	push   $0x0
  pushl $100
  1022ed:	6a 64                	push   $0x64
  jmp __alltraps
  1022ef:	e9 f3 06 00 00       	jmp    1029e7 <__alltraps>

001022f4 <vector101>:
.globl vector101
vector101:
  pushl $0
  1022f4:	6a 00                	push   $0x0
  pushl $101
  1022f6:	6a 65                	push   $0x65
  jmp __alltraps
  1022f8:	e9 ea 06 00 00       	jmp    1029e7 <__alltraps>

001022fd <vector102>:
.globl vector102
vector102:
  pushl $0
  1022fd:	6a 00                	push   $0x0
  pushl $102
  1022ff:	6a 66                	push   $0x66
  jmp __alltraps
  102301:	e9 e1 06 00 00       	jmp    1029e7 <__alltraps>

00102306 <vector103>:
.globl vector103
vector103:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $103
  102308:	6a 67                	push   $0x67
  jmp __alltraps
  10230a:	e9 d8 06 00 00       	jmp    1029e7 <__alltraps>

0010230f <vector104>:
.globl vector104
vector104:
  pushl $0
  10230f:	6a 00                	push   $0x0
  pushl $104
  102311:	6a 68                	push   $0x68
  jmp __alltraps
  102313:	e9 cf 06 00 00       	jmp    1029e7 <__alltraps>

00102318 <vector105>:
.globl vector105
vector105:
  pushl $0
  102318:	6a 00                	push   $0x0
  pushl $105
  10231a:	6a 69                	push   $0x69
  jmp __alltraps
  10231c:	e9 c6 06 00 00       	jmp    1029e7 <__alltraps>

00102321 <vector106>:
.globl vector106
vector106:
  pushl $0
  102321:	6a 00                	push   $0x0
  pushl $106
  102323:	6a 6a                	push   $0x6a
  jmp __alltraps
  102325:	e9 bd 06 00 00       	jmp    1029e7 <__alltraps>

0010232a <vector107>:
.globl vector107
vector107:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $107
  10232c:	6a 6b                	push   $0x6b
  jmp __alltraps
  10232e:	e9 b4 06 00 00       	jmp    1029e7 <__alltraps>

00102333 <vector108>:
.globl vector108
vector108:
  pushl $0
  102333:	6a 00                	push   $0x0
  pushl $108
  102335:	6a 6c                	push   $0x6c
  jmp __alltraps
  102337:	e9 ab 06 00 00       	jmp    1029e7 <__alltraps>

0010233c <vector109>:
.globl vector109
vector109:
  pushl $0
  10233c:	6a 00                	push   $0x0
  pushl $109
  10233e:	6a 6d                	push   $0x6d
  jmp __alltraps
  102340:	e9 a2 06 00 00       	jmp    1029e7 <__alltraps>

00102345 <vector110>:
.globl vector110
vector110:
  pushl $0
  102345:	6a 00                	push   $0x0
  pushl $110
  102347:	6a 6e                	push   $0x6e
  jmp __alltraps
  102349:	e9 99 06 00 00       	jmp    1029e7 <__alltraps>

0010234e <vector111>:
.globl vector111
vector111:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $111
  102350:	6a 6f                	push   $0x6f
  jmp __alltraps
  102352:	e9 90 06 00 00       	jmp    1029e7 <__alltraps>

00102357 <vector112>:
.globl vector112
vector112:
  pushl $0
  102357:	6a 00                	push   $0x0
  pushl $112
  102359:	6a 70                	push   $0x70
  jmp __alltraps
  10235b:	e9 87 06 00 00       	jmp    1029e7 <__alltraps>

00102360 <vector113>:
.globl vector113
vector113:
  pushl $0
  102360:	6a 00                	push   $0x0
  pushl $113
  102362:	6a 71                	push   $0x71
  jmp __alltraps
  102364:	e9 7e 06 00 00       	jmp    1029e7 <__alltraps>

00102369 <vector114>:
.globl vector114
vector114:
  pushl $0
  102369:	6a 00                	push   $0x0
  pushl $114
  10236b:	6a 72                	push   $0x72
  jmp __alltraps
  10236d:	e9 75 06 00 00       	jmp    1029e7 <__alltraps>

00102372 <vector115>:
.globl vector115
vector115:
  pushl $0
  102372:	6a 00                	push   $0x0
  pushl $115
  102374:	6a 73                	push   $0x73
  jmp __alltraps
  102376:	e9 6c 06 00 00       	jmp    1029e7 <__alltraps>

0010237b <vector116>:
.globl vector116
vector116:
  pushl $0
  10237b:	6a 00                	push   $0x0
  pushl $116
  10237d:	6a 74                	push   $0x74
  jmp __alltraps
  10237f:	e9 63 06 00 00       	jmp    1029e7 <__alltraps>

00102384 <vector117>:
.globl vector117
vector117:
  pushl $0
  102384:	6a 00                	push   $0x0
  pushl $117
  102386:	6a 75                	push   $0x75
  jmp __alltraps
  102388:	e9 5a 06 00 00       	jmp    1029e7 <__alltraps>

0010238d <vector118>:
.globl vector118
vector118:
  pushl $0
  10238d:	6a 00                	push   $0x0
  pushl $118
  10238f:	6a 76                	push   $0x76
  jmp __alltraps
  102391:	e9 51 06 00 00       	jmp    1029e7 <__alltraps>

00102396 <vector119>:
.globl vector119
vector119:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $119
  102398:	6a 77                	push   $0x77
  jmp __alltraps
  10239a:	e9 48 06 00 00       	jmp    1029e7 <__alltraps>

0010239f <vector120>:
.globl vector120
vector120:
  pushl $0
  10239f:	6a 00                	push   $0x0
  pushl $120
  1023a1:	6a 78                	push   $0x78
  jmp __alltraps
  1023a3:	e9 3f 06 00 00       	jmp    1029e7 <__alltraps>

001023a8 <vector121>:
.globl vector121
vector121:
  pushl $0
  1023a8:	6a 00                	push   $0x0
  pushl $121
  1023aa:	6a 79                	push   $0x79
  jmp __alltraps
  1023ac:	e9 36 06 00 00       	jmp    1029e7 <__alltraps>

001023b1 <vector122>:
.globl vector122
vector122:
  pushl $0
  1023b1:	6a 00                	push   $0x0
  pushl $122
  1023b3:	6a 7a                	push   $0x7a
  jmp __alltraps
  1023b5:	e9 2d 06 00 00       	jmp    1029e7 <__alltraps>

001023ba <vector123>:
.globl vector123
vector123:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $123
  1023bc:	6a 7b                	push   $0x7b
  jmp __alltraps
  1023be:	e9 24 06 00 00       	jmp    1029e7 <__alltraps>

001023c3 <vector124>:
.globl vector124
vector124:
  pushl $0
  1023c3:	6a 00                	push   $0x0
  pushl $124
  1023c5:	6a 7c                	push   $0x7c
  jmp __alltraps
  1023c7:	e9 1b 06 00 00       	jmp    1029e7 <__alltraps>

001023cc <vector125>:
.globl vector125
vector125:
  pushl $0
  1023cc:	6a 00                	push   $0x0
  pushl $125
  1023ce:	6a 7d                	push   $0x7d
  jmp __alltraps
  1023d0:	e9 12 06 00 00       	jmp    1029e7 <__alltraps>

001023d5 <vector126>:
.globl vector126
vector126:
  pushl $0
  1023d5:	6a 00                	push   $0x0
  pushl $126
  1023d7:	6a 7e                	push   $0x7e
  jmp __alltraps
  1023d9:	e9 09 06 00 00       	jmp    1029e7 <__alltraps>

001023de <vector127>:
.globl vector127
vector127:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $127
  1023e0:	6a 7f                	push   $0x7f
  jmp __alltraps
  1023e2:	e9 00 06 00 00       	jmp    1029e7 <__alltraps>

001023e7 <vector128>:
.globl vector128
vector128:
  pushl $0
  1023e7:	6a 00                	push   $0x0
  pushl $128
  1023e9:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1023ee:	e9 f4 05 00 00       	jmp    1029e7 <__alltraps>

001023f3 <vector129>:
.globl vector129
vector129:
  pushl $0
  1023f3:	6a 00                	push   $0x0
  pushl $129
  1023f5:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1023fa:	e9 e8 05 00 00       	jmp    1029e7 <__alltraps>

001023ff <vector130>:
.globl vector130
vector130:
  pushl $0
  1023ff:	6a 00                	push   $0x0
  pushl $130
  102401:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102406:	e9 dc 05 00 00       	jmp    1029e7 <__alltraps>

0010240b <vector131>:
.globl vector131
vector131:
  pushl $0
  10240b:	6a 00                	push   $0x0
  pushl $131
  10240d:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102412:	e9 d0 05 00 00       	jmp    1029e7 <__alltraps>

00102417 <vector132>:
.globl vector132
vector132:
  pushl $0
  102417:	6a 00                	push   $0x0
  pushl $132
  102419:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10241e:	e9 c4 05 00 00       	jmp    1029e7 <__alltraps>

00102423 <vector133>:
.globl vector133
vector133:
  pushl $0
  102423:	6a 00                	push   $0x0
  pushl $133
  102425:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10242a:	e9 b8 05 00 00       	jmp    1029e7 <__alltraps>

0010242f <vector134>:
.globl vector134
vector134:
  pushl $0
  10242f:	6a 00                	push   $0x0
  pushl $134
  102431:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102436:	e9 ac 05 00 00       	jmp    1029e7 <__alltraps>

0010243b <vector135>:
.globl vector135
vector135:
  pushl $0
  10243b:	6a 00                	push   $0x0
  pushl $135
  10243d:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102442:	e9 a0 05 00 00       	jmp    1029e7 <__alltraps>

00102447 <vector136>:
.globl vector136
vector136:
  pushl $0
  102447:	6a 00                	push   $0x0
  pushl $136
  102449:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10244e:	e9 94 05 00 00       	jmp    1029e7 <__alltraps>

00102453 <vector137>:
.globl vector137
vector137:
  pushl $0
  102453:	6a 00                	push   $0x0
  pushl $137
  102455:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10245a:	e9 88 05 00 00       	jmp    1029e7 <__alltraps>

0010245f <vector138>:
.globl vector138
vector138:
  pushl $0
  10245f:	6a 00                	push   $0x0
  pushl $138
  102461:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102466:	e9 7c 05 00 00       	jmp    1029e7 <__alltraps>

0010246b <vector139>:
.globl vector139
vector139:
  pushl $0
  10246b:	6a 00                	push   $0x0
  pushl $139
  10246d:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102472:	e9 70 05 00 00       	jmp    1029e7 <__alltraps>

00102477 <vector140>:
.globl vector140
vector140:
  pushl $0
  102477:	6a 00                	push   $0x0
  pushl $140
  102479:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10247e:	e9 64 05 00 00       	jmp    1029e7 <__alltraps>

00102483 <vector141>:
.globl vector141
vector141:
  pushl $0
  102483:	6a 00                	push   $0x0
  pushl $141
  102485:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10248a:	e9 58 05 00 00       	jmp    1029e7 <__alltraps>

0010248f <vector142>:
.globl vector142
vector142:
  pushl $0
  10248f:	6a 00                	push   $0x0
  pushl $142
  102491:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102496:	e9 4c 05 00 00       	jmp    1029e7 <__alltraps>

0010249b <vector143>:
.globl vector143
vector143:
  pushl $0
  10249b:	6a 00                	push   $0x0
  pushl $143
  10249d:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1024a2:	e9 40 05 00 00       	jmp    1029e7 <__alltraps>

001024a7 <vector144>:
.globl vector144
vector144:
  pushl $0
  1024a7:	6a 00                	push   $0x0
  pushl $144
  1024a9:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1024ae:	e9 34 05 00 00       	jmp    1029e7 <__alltraps>

001024b3 <vector145>:
.globl vector145
vector145:
  pushl $0
  1024b3:	6a 00                	push   $0x0
  pushl $145
  1024b5:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1024ba:	e9 28 05 00 00       	jmp    1029e7 <__alltraps>

001024bf <vector146>:
.globl vector146
vector146:
  pushl $0
  1024bf:	6a 00                	push   $0x0
  pushl $146
  1024c1:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1024c6:	e9 1c 05 00 00       	jmp    1029e7 <__alltraps>

001024cb <vector147>:
.globl vector147
vector147:
  pushl $0
  1024cb:	6a 00                	push   $0x0
  pushl $147
  1024cd:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1024d2:	e9 10 05 00 00       	jmp    1029e7 <__alltraps>

001024d7 <vector148>:
.globl vector148
vector148:
  pushl $0
  1024d7:	6a 00                	push   $0x0
  pushl $148
  1024d9:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1024de:	e9 04 05 00 00       	jmp    1029e7 <__alltraps>

001024e3 <vector149>:
.globl vector149
vector149:
  pushl $0
  1024e3:	6a 00                	push   $0x0
  pushl $149
  1024e5:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1024ea:	e9 f8 04 00 00       	jmp    1029e7 <__alltraps>

001024ef <vector150>:
.globl vector150
vector150:
  pushl $0
  1024ef:	6a 00                	push   $0x0
  pushl $150
  1024f1:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1024f6:	e9 ec 04 00 00       	jmp    1029e7 <__alltraps>

001024fb <vector151>:
.globl vector151
vector151:
  pushl $0
  1024fb:	6a 00                	push   $0x0
  pushl $151
  1024fd:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102502:	e9 e0 04 00 00       	jmp    1029e7 <__alltraps>

00102507 <vector152>:
.globl vector152
vector152:
  pushl $0
  102507:	6a 00                	push   $0x0
  pushl $152
  102509:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10250e:	e9 d4 04 00 00       	jmp    1029e7 <__alltraps>

00102513 <vector153>:
.globl vector153
vector153:
  pushl $0
  102513:	6a 00                	push   $0x0
  pushl $153
  102515:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10251a:	e9 c8 04 00 00       	jmp    1029e7 <__alltraps>

0010251f <vector154>:
.globl vector154
vector154:
  pushl $0
  10251f:	6a 00                	push   $0x0
  pushl $154
  102521:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102526:	e9 bc 04 00 00       	jmp    1029e7 <__alltraps>

0010252b <vector155>:
.globl vector155
vector155:
  pushl $0
  10252b:	6a 00                	push   $0x0
  pushl $155
  10252d:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102532:	e9 b0 04 00 00       	jmp    1029e7 <__alltraps>

00102537 <vector156>:
.globl vector156
vector156:
  pushl $0
  102537:	6a 00                	push   $0x0
  pushl $156
  102539:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10253e:	e9 a4 04 00 00       	jmp    1029e7 <__alltraps>

00102543 <vector157>:
.globl vector157
vector157:
  pushl $0
  102543:	6a 00                	push   $0x0
  pushl $157
  102545:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10254a:	e9 98 04 00 00       	jmp    1029e7 <__alltraps>

0010254f <vector158>:
.globl vector158
vector158:
  pushl $0
  10254f:	6a 00                	push   $0x0
  pushl $158
  102551:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102556:	e9 8c 04 00 00       	jmp    1029e7 <__alltraps>

0010255b <vector159>:
.globl vector159
vector159:
  pushl $0
  10255b:	6a 00                	push   $0x0
  pushl $159
  10255d:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102562:	e9 80 04 00 00       	jmp    1029e7 <__alltraps>

00102567 <vector160>:
.globl vector160
vector160:
  pushl $0
  102567:	6a 00                	push   $0x0
  pushl $160
  102569:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10256e:	e9 74 04 00 00       	jmp    1029e7 <__alltraps>

00102573 <vector161>:
.globl vector161
vector161:
  pushl $0
  102573:	6a 00                	push   $0x0
  pushl $161
  102575:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10257a:	e9 68 04 00 00       	jmp    1029e7 <__alltraps>

0010257f <vector162>:
.globl vector162
vector162:
  pushl $0
  10257f:	6a 00                	push   $0x0
  pushl $162
  102581:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102586:	e9 5c 04 00 00       	jmp    1029e7 <__alltraps>

0010258b <vector163>:
.globl vector163
vector163:
  pushl $0
  10258b:	6a 00                	push   $0x0
  pushl $163
  10258d:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102592:	e9 50 04 00 00       	jmp    1029e7 <__alltraps>

00102597 <vector164>:
.globl vector164
vector164:
  pushl $0
  102597:	6a 00                	push   $0x0
  pushl $164
  102599:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10259e:	e9 44 04 00 00       	jmp    1029e7 <__alltraps>

001025a3 <vector165>:
.globl vector165
vector165:
  pushl $0
  1025a3:	6a 00                	push   $0x0
  pushl $165
  1025a5:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1025aa:	e9 38 04 00 00       	jmp    1029e7 <__alltraps>

001025af <vector166>:
.globl vector166
vector166:
  pushl $0
  1025af:	6a 00                	push   $0x0
  pushl $166
  1025b1:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1025b6:	e9 2c 04 00 00       	jmp    1029e7 <__alltraps>

001025bb <vector167>:
.globl vector167
vector167:
  pushl $0
  1025bb:	6a 00                	push   $0x0
  pushl $167
  1025bd:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1025c2:	e9 20 04 00 00       	jmp    1029e7 <__alltraps>

001025c7 <vector168>:
.globl vector168
vector168:
  pushl $0
  1025c7:	6a 00                	push   $0x0
  pushl $168
  1025c9:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1025ce:	e9 14 04 00 00       	jmp    1029e7 <__alltraps>

001025d3 <vector169>:
.globl vector169
vector169:
  pushl $0
  1025d3:	6a 00                	push   $0x0
  pushl $169
  1025d5:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1025da:	e9 08 04 00 00       	jmp    1029e7 <__alltraps>

001025df <vector170>:
.globl vector170
vector170:
  pushl $0
  1025df:	6a 00                	push   $0x0
  pushl $170
  1025e1:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1025e6:	e9 fc 03 00 00       	jmp    1029e7 <__alltraps>

001025eb <vector171>:
.globl vector171
vector171:
  pushl $0
  1025eb:	6a 00                	push   $0x0
  pushl $171
  1025ed:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1025f2:	e9 f0 03 00 00       	jmp    1029e7 <__alltraps>

001025f7 <vector172>:
.globl vector172
vector172:
  pushl $0
  1025f7:	6a 00                	push   $0x0
  pushl $172
  1025f9:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1025fe:	e9 e4 03 00 00       	jmp    1029e7 <__alltraps>

00102603 <vector173>:
.globl vector173
vector173:
  pushl $0
  102603:	6a 00                	push   $0x0
  pushl $173
  102605:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10260a:	e9 d8 03 00 00       	jmp    1029e7 <__alltraps>

0010260f <vector174>:
.globl vector174
vector174:
  pushl $0
  10260f:	6a 00                	push   $0x0
  pushl $174
  102611:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102616:	e9 cc 03 00 00       	jmp    1029e7 <__alltraps>

0010261b <vector175>:
.globl vector175
vector175:
  pushl $0
  10261b:	6a 00                	push   $0x0
  pushl $175
  10261d:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102622:	e9 c0 03 00 00       	jmp    1029e7 <__alltraps>

00102627 <vector176>:
.globl vector176
vector176:
  pushl $0
  102627:	6a 00                	push   $0x0
  pushl $176
  102629:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10262e:	e9 b4 03 00 00       	jmp    1029e7 <__alltraps>

00102633 <vector177>:
.globl vector177
vector177:
  pushl $0
  102633:	6a 00                	push   $0x0
  pushl $177
  102635:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10263a:	e9 a8 03 00 00       	jmp    1029e7 <__alltraps>

0010263f <vector178>:
.globl vector178
vector178:
  pushl $0
  10263f:	6a 00                	push   $0x0
  pushl $178
  102641:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102646:	e9 9c 03 00 00       	jmp    1029e7 <__alltraps>

0010264b <vector179>:
.globl vector179
vector179:
  pushl $0
  10264b:	6a 00                	push   $0x0
  pushl $179
  10264d:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102652:	e9 90 03 00 00       	jmp    1029e7 <__alltraps>

00102657 <vector180>:
.globl vector180
vector180:
  pushl $0
  102657:	6a 00                	push   $0x0
  pushl $180
  102659:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10265e:	e9 84 03 00 00       	jmp    1029e7 <__alltraps>

00102663 <vector181>:
.globl vector181
vector181:
  pushl $0
  102663:	6a 00                	push   $0x0
  pushl $181
  102665:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10266a:	e9 78 03 00 00       	jmp    1029e7 <__alltraps>

0010266f <vector182>:
.globl vector182
vector182:
  pushl $0
  10266f:	6a 00                	push   $0x0
  pushl $182
  102671:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102676:	e9 6c 03 00 00       	jmp    1029e7 <__alltraps>

0010267b <vector183>:
.globl vector183
vector183:
  pushl $0
  10267b:	6a 00                	push   $0x0
  pushl $183
  10267d:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102682:	e9 60 03 00 00       	jmp    1029e7 <__alltraps>

00102687 <vector184>:
.globl vector184
vector184:
  pushl $0
  102687:	6a 00                	push   $0x0
  pushl $184
  102689:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10268e:	e9 54 03 00 00       	jmp    1029e7 <__alltraps>

00102693 <vector185>:
.globl vector185
vector185:
  pushl $0
  102693:	6a 00                	push   $0x0
  pushl $185
  102695:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10269a:	e9 48 03 00 00       	jmp    1029e7 <__alltraps>

0010269f <vector186>:
.globl vector186
vector186:
  pushl $0
  10269f:	6a 00                	push   $0x0
  pushl $186
  1026a1:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1026a6:	e9 3c 03 00 00       	jmp    1029e7 <__alltraps>

001026ab <vector187>:
.globl vector187
vector187:
  pushl $0
  1026ab:	6a 00                	push   $0x0
  pushl $187
  1026ad:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1026b2:	e9 30 03 00 00       	jmp    1029e7 <__alltraps>

001026b7 <vector188>:
.globl vector188
vector188:
  pushl $0
  1026b7:	6a 00                	push   $0x0
  pushl $188
  1026b9:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1026be:	e9 24 03 00 00       	jmp    1029e7 <__alltraps>

001026c3 <vector189>:
.globl vector189
vector189:
  pushl $0
  1026c3:	6a 00                	push   $0x0
  pushl $189
  1026c5:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1026ca:	e9 18 03 00 00       	jmp    1029e7 <__alltraps>

001026cf <vector190>:
.globl vector190
vector190:
  pushl $0
  1026cf:	6a 00                	push   $0x0
  pushl $190
  1026d1:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1026d6:	e9 0c 03 00 00       	jmp    1029e7 <__alltraps>

001026db <vector191>:
.globl vector191
vector191:
  pushl $0
  1026db:	6a 00                	push   $0x0
  pushl $191
  1026dd:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1026e2:	e9 00 03 00 00       	jmp    1029e7 <__alltraps>

001026e7 <vector192>:
.globl vector192
vector192:
  pushl $0
  1026e7:	6a 00                	push   $0x0
  pushl $192
  1026e9:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1026ee:	e9 f4 02 00 00       	jmp    1029e7 <__alltraps>

001026f3 <vector193>:
.globl vector193
vector193:
  pushl $0
  1026f3:	6a 00                	push   $0x0
  pushl $193
  1026f5:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1026fa:	e9 e8 02 00 00       	jmp    1029e7 <__alltraps>

001026ff <vector194>:
.globl vector194
vector194:
  pushl $0
  1026ff:	6a 00                	push   $0x0
  pushl $194
  102701:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102706:	e9 dc 02 00 00       	jmp    1029e7 <__alltraps>

0010270b <vector195>:
.globl vector195
vector195:
  pushl $0
  10270b:	6a 00                	push   $0x0
  pushl $195
  10270d:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102712:	e9 d0 02 00 00       	jmp    1029e7 <__alltraps>

00102717 <vector196>:
.globl vector196
vector196:
  pushl $0
  102717:	6a 00                	push   $0x0
  pushl $196
  102719:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10271e:	e9 c4 02 00 00       	jmp    1029e7 <__alltraps>

00102723 <vector197>:
.globl vector197
vector197:
  pushl $0
  102723:	6a 00                	push   $0x0
  pushl $197
  102725:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10272a:	e9 b8 02 00 00       	jmp    1029e7 <__alltraps>

0010272f <vector198>:
.globl vector198
vector198:
  pushl $0
  10272f:	6a 00                	push   $0x0
  pushl $198
  102731:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102736:	e9 ac 02 00 00       	jmp    1029e7 <__alltraps>

0010273b <vector199>:
.globl vector199
vector199:
  pushl $0
  10273b:	6a 00                	push   $0x0
  pushl $199
  10273d:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102742:	e9 a0 02 00 00       	jmp    1029e7 <__alltraps>

00102747 <vector200>:
.globl vector200
vector200:
  pushl $0
  102747:	6a 00                	push   $0x0
  pushl $200
  102749:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10274e:	e9 94 02 00 00       	jmp    1029e7 <__alltraps>

00102753 <vector201>:
.globl vector201
vector201:
  pushl $0
  102753:	6a 00                	push   $0x0
  pushl $201
  102755:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10275a:	e9 88 02 00 00       	jmp    1029e7 <__alltraps>

0010275f <vector202>:
.globl vector202
vector202:
  pushl $0
  10275f:	6a 00                	push   $0x0
  pushl $202
  102761:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102766:	e9 7c 02 00 00       	jmp    1029e7 <__alltraps>

0010276b <vector203>:
.globl vector203
vector203:
  pushl $0
  10276b:	6a 00                	push   $0x0
  pushl $203
  10276d:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102772:	e9 70 02 00 00       	jmp    1029e7 <__alltraps>

00102777 <vector204>:
.globl vector204
vector204:
  pushl $0
  102777:	6a 00                	push   $0x0
  pushl $204
  102779:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10277e:	e9 64 02 00 00       	jmp    1029e7 <__alltraps>

00102783 <vector205>:
.globl vector205
vector205:
  pushl $0
  102783:	6a 00                	push   $0x0
  pushl $205
  102785:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10278a:	e9 58 02 00 00       	jmp    1029e7 <__alltraps>

0010278f <vector206>:
.globl vector206
vector206:
  pushl $0
  10278f:	6a 00                	push   $0x0
  pushl $206
  102791:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102796:	e9 4c 02 00 00       	jmp    1029e7 <__alltraps>

0010279b <vector207>:
.globl vector207
vector207:
  pushl $0
  10279b:	6a 00                	push   $0x0
  pushl $207
  10279d:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1027a2:	e9 40 02 00 00       	jmp    1029e7 <__alltraps>

001027a7 <vector208>:
.globl vector208
vector208:
  pushl $0
  1027a7:	6a 00                	push   $0x0
  pushl $208
  1027a9:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1027ae:	e9 34 02 00 00       	jmp    1029e7 <__alltraps>

001027b3 <vector209>:
.globl vector209
vector209:
  pushl $0
  1027b3:	6a 00                	push   $0x0
  pushl $209
  1027b5:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1027ba:	e9 28 02 00 00       	jmp    1029e7 <__alltraps>

001027bf <vector210>:
.globl vector210
vector210:
  pushl $0
  1027bf:	6a 00                	push   $0x0
  pushl $210
  1027c1:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1027c6:	e9 1c 02 00 00       	jmp    1029e7 <__alltraps>

001027cb <vector211>:
.globl vector211
vector211:
  pushl $0
  1027cb:	6a 00                	push   $0x0
  pushl $211
  1027cd:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1027d2:	e9 10 02 00 00       	jmp    1029e7 <__alltraps>

001027d7 <vector212>:
.globl vector212
vector212:
  pushl $0
  1027d7:	6a 00                	push   $0x0
  pushl $212
  1027d9:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1027de:	e9 04 02 00 00       	jmp    1029e7 <__alltraps>

001027e3 <vector213>:
.globl vector213
vector213:
  pushl $0
  1027e3:	6a 00                	push   $0x0
  pushl $213
  1027e5:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1027ea:	e9 f8 01 00 00       	jmp    1029e7 <__alltraps>

001027ef <vector214>:
.globl vector214
vector214:
  pushl $0
  1027ef:	6a 00                	push   $0x0
  pushl $214
  1027f1:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1027f6:	e9 ec 01 00 00       	jmp    1029e7 <__alltraps>

001027fb <vector215>:
.globl vector215
vector215:
  pushl $0
  1027fb:	6a 00                	push   $0x0
  pushl $215
  1027fd:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102802:	e9 e0 01 00 00       	jmp    1029e7 <__alltraps>

00102807 <vector216>:
.globl vector216
vector216:
  pushl $0
  102807:	6a 00                	push   $0x0
  pushl $216
  102809:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10280e:	e9 d4 01 00 00       	jmp    1029e7 <__alltraps>

00102813 <vector217>:
.globl vector217
vector217:
  pushl $0
  102813:	6a 00                	push   $0x0
  pushl $217
  102815:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10281a:	e9 c8 01 00 00       	jmp    1029e7 <__alltraps>

0010281f <vector218>:
.globl vector218
vector218:
  pushl $0
  10281f:	6a 00                	push   $0x0
  pushl $218
  102821:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102826:	e9 bc 01 00 00       	jmp    1029e7 <__alltraps>

0010282b <vector219>:
.globl vector219
vector219:
  pushl $0
  10282b:	6a 00                	push   $0x0
  pushl $219
  10282d:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102832:	e9 b0 01 00 00       	jmp    1029e7 <__alltraps>

00102837 <vector220>:
.globl vector220
vector220:
  pushl $0
  102837:	6a 00                	push   $0x0
  pushl $220
  102839:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10283e:	e9 a4 01 00 00       	jmp    1029e7 <__alltraps>

00102843 <vector221>:
.globl vector221
vector221:
  pushl $0
  102843:	6a 00                	push   $0x0
  pushl $221
  102845:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10284a:	e9 98 01 00 00       	jmp    1029e7 <__alltraps>

0010284f <vector222>:
.globl vector222
vector222:
  pushl $0
  10284f:	6a 00                	push   $0x0
  pushl $222
  102851:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102856:	e9 8c 01 00 00       	jmp    1029e7 <__alltraps>

0010285b <vector223>:
.globl vector223
vector223:
  pushl $0
  10285b:	6a 00                	push   $0x0
  pushl $223
  10285d:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102862:	e9 80 01 00 00       	jmp    1029e7 <__alltraps>

00102867 <vector224>:
.globl vector224
vector224:
  pushl $0
  102867:	6a 00                	push   $0x0
  pushl $224
  102869:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10286e:	e9 74 01 00 00       	jmp    1029e7 <__alltraps>

00102873 <vector225>:
.globl vector225
vector225:
  pushl $0
  102873:	6a 00                	push   $0x0
  pushl $225
  102875:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10287a:	e9 68 01 00 00       	jmp    1029e7 <__alltraps>

0010287f <vector226>:
.globl vector226
vector226:
  pushl $0
  10287f:	6a 00                	push   $0x0
  pushl $226
  102881:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102886:	e9 5c 01 00 00       	jmp    1029e7 <__alltraps>

0010288b <vector227>:
.globl vector227
vector227:
  pushl $0
  10288b:	6a 00                	push   $0x0
  pushl $227
  10288d:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102892:	e9 50 01 00 00       	jmp    1029e7 <__alltraps>

00102897 <vector228>:
.globl vector228
vector228:
  pushl $0
  102897:	6a 00                	push   $0x0
  pushl $228
  102899:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10289e:	e9 44 01 00 00       	jmp    1029e7 <__alltraps>

001028a3 <vector229>:
.globl vector229
vector229:
  pushl $0
  1028a3:	6a 00                	push   $0x0
  pushl $229
  1028a5:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1028aa:	e9 38 01 00 00       	jmp    1029e7 <__alltraps>

001028af <vector230>:
.globl vector230
vector230:
  pushl $0
  1028af:	6a 00                	push   $0x0
  pushl $230
  1028b1:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1028b6:	e9 2c 01 00 00       	jmp    1029e7 <__alltraps>

001028bb <vector231>:
.globl vector231
vector231:
  pushl $0
  1028bb:	6a 00                	push   $0x0
  pushl $231
  1028bd:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1028c2:	e9 20 01 00 00       	jmp    1029e7 <__alltraps>

001028c7 <vector232>:
.globl vector232
vector232:
  pushl $0
  1028c7:	6a 00                	push   $0x0
  pushl $232
  1028c9:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1028ce:	e9 14 01 00 00       	jmp    1029e7 <__alltraps>

001028d3 <vector233>:
.globl vector233
vector233:
  pushl $0
  1028d3:	6a 00                	push   $0x0
  pushl $233
  1028d5:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1028da:	e9 08 01 00 00       	jmp    1029e7 <__alltraps>

001028df <vector234>:
.globl vector234
vector234:
  pushl $0
  1028df:	6a 00                	push   $0x0
  pushl $234
  1028e1:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1028e6:	e9 fc 00 00 00       	jmp    1029e7 <__alltraps>

001028eb <vector235>:
.globl vector235
vector235:
  pushl $0
  1028eb:	6a 00                	push   $0x0
  pushl $235
  1028ed:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1028f2:	e9 f0 00 00 00       	jmp    1029e7 <__alltraps>

001028f7 <vector236>:
.globl vector236
vector236:
  pushl $0
  1028f7:	6a 00                	push   $0x0
  pushl $236
  1028f9:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1028fe:	e9 e4 00 00 00       	jmp    1029e7 <__alltraps>

00102903 <vector237>:
.globl vector237
vector237:
  pushl $0
  102903:	6a 00                	push   $0x0
  pushl $237
  102905:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10290a:	e9 d8 00 00 00       	jmp    1029e7 <__alltraps>

0010290f <vector238>:
.globl vector238
vector238:
  pushl $0
  10290f:	6a 00                	push   $0x0
  pushl $238
  102911:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102916:	e9 cc 00 00 00       	jmp    1029e7 <__alltraps>

0010291b <vector239>:
.globl vector239
vector239:
  pushl $0
  10291b:	6a 00                	push   $0x0
  pushl $239
  10291d:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102922:	e9 c0 00 00 00       	jmp    1029e7 <__alltraps>

00102927 <vector240>:
.globl vector240
vector240:
  pushl $0
  102927:	6a 00                	push   $0x0
  pushl $240
  102929:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10292e:	e9 b4 00 00 00       	jmp    1029e7 <__alltraps>

00102933 <vector241>:
.globl vector241
vector241:
  pushl $0
  102933:	6a 00                	push   $0x0
  pushl $241
  102935:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10293a:	e9 a8 00 00 00       	jmp    1029e7 <__alltraps>

0010293f <vector242>:
.globl vector242
vector242:
  pushl $0
  10293f:	6a 00                	push   $0x0
  pushl $242
  102941:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102946:	e9 9c 00 00 00       	jmp    1029e7 <__alltraps>

0010294b <vector243>:
.globl vector243
vector243:
  pushl $0
  10294b:	6a 00                	push   $0x0
  pushl $243
  10294d:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102952:	e9 90 00 00 00       	jmp    1029e7 <__alltraps>

00102957 <vector244>:
.globl vector244
vector244:
  pushl $0
  102957:	6a 00                	push   $0x0
  pushl $244
  102959:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10295e:	e9 84 00 00 00       	jmp    1029e7 <__alltraps>

00102963 <vector245>:
.globl vector245
vector245:
  pushl $0
  102963:	6a 00                	push   $0x0
  pushl $245
  102965:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10296a:	e9 78 00 00 00       	jmp    1029e7 <__alltraps>

0010296f <vector246>:
.globl vector246
vector246:
  pushl $0
  10296f:	6a 00                	push   $0x0
  pushl $246
  102971:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102976:	e9 6c 00 00 00       	jmp    1029e7 <__alltraps>

0010297b <vector247>:
.globl vector247
vector247:
  pushl $0
  10297b:	6a 00                	push   $0x0
  pushl $247
  10297d:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102982:	e9 60 00 00 00       	jmp    1029e7 <__alltraps>

00102987 <vector248>:
.globl vector248
vector248:
  pushl $0
  102987:	6a 00                	push   $0x0
  pushl $248
  102989:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10298e:	e9 54 00 00 00       	jmp    1029e7 <__alltraps>

00102993 <vector249>:
.globl vector249
vector249:
  pushl $0
  102993:	6a 00                	push   $0x0
  pushl $249
  102995:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10299a:	e9 48 00 00 00       	jmp    1029e7 <__alltraps>

0010299f <vector250>:
.globl vector250
vector250:
  pushl $0
  10299f:	6a 00                	push   $0x0
  pushl $250
  1029a1:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1029a6:	e9 3c 00 00 00       	jmp    1029e7 <__alltraps>

001029ab <vector251>:
.globl vector251
vector251:
  pushl $0
  1029ab:	6a 00                	push   $0x0
  pushl $251
  1029ad:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1029b2:	e9 30 00 00 00       	jmp    1029e7 <__alltraps>

001029b7 <vector252>:
.globl vector252
vector252:
  pushl $0
  1029b7:	6a 00                	push   $0x0
  pushl $252
  1029b9:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1029be:	e9 24 00 00 00       	jmp    1029e7 <__alltraps>

001029c3 <vector253>:
.globl vector253
vector253:
  pushl $0
  1029c3:	6a 00                	push   $0x0
  pushl $253
  1029c5:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1029ca:	e9 18 00 00 00       	jmp    1029e7 <__alltraps>

001029cf <vector254>:
.globl vector254
vector254:
  pushl $0
  1029cf:	6a 00                	push   $0x0
  pushl $254
  1029d1:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1029d6:	e9 0c 00 00 00       	jmp    1029e7 <__alltraps>

001029db <vector255>:
.globl vector255
vector255:
  pushl $0
  1029db:	6a 00                	push   $0x0
  pushl $255
  1029dd:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1029e2:	e9 00 00 00 00       	jmp    1029e7 <__alltraps>

001029e7 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1029e7:	1e                   	push   %ds
    pushl %es
  1029e8:	06                   	push   %es
    pushl %fs
  1029e9:	0f a0                	push   %fs
    pushl %gs
  1029eb:	0f a8                	push   %gs
    pushal
  1029ed:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  1029ee:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  1029f3:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  1029f5:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  1029f7:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  1029f8:	e8 5f f5 ff ff       	call   101f5c <trap>

    # pop the pushed stack pointer
    popl %esp
  1029fd:	5c                   	pop    %esp

001029fe <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  1029fe:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  1029ff:	0f a9                	pop    %gs
    popl %fs
  102a01:	0f a1                	pop    %fs
    popl %es
  102a03:	07                   	pop    %es
    popl %ds
  102a04:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102a05:	83 c4 08             	add    $0x8,%esp
    iret
  102a08:	cf                   	iret   

00102a09 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102a09:	55                   	push   %ebp
  102a0a:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102a0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a0f:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102a12:	b8 23 00 00 00       	mov    $0x23,%eax
  102a17:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102a19:	b8 23 00 00 00       	mov    $0x23,%eax
  102a1e:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102a20:	b8 10 00 00 00       	mov    $0x10,%eax
  102a25:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102a27:	b8 10 00 00 00       	mov    $0x10,%eax
  102a2c:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102a2e:	b8 10 00 00 00       	mov    $0x10,%eax
  102a33:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102a35:	ea 3c 2a 10 00 08 00 	ljmp   $0x8,$0x102a3c
}
  102a3c:	90                   	nop
  102a3d:	5d                   	pop    %ebp
  102a3e:	c3                   	ret    

00102a3f <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102a3f:	f3 0f 1e fb          	endbr32 
  102a43:	55                   	push   %ebp
  102a44:	89 e5                	mov    %esp,%ebp
  102a46:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102a49:	b8 80 09 11 00       	mov    $0x110980,%eax
  102a4e:	05 00 04 00 00       	add    $0x400,%eax
  102a53:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  102a58:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  102a5f:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102a61:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102a68:	68 00 
  102a6a:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102a6f:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  102a75:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102a7a:	c1 e8 10             	shr    $0x10,%eax
  102a7d:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  102a82:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a89:	83 e0 f0             	and    $0xfffffff0,%eax
  102a8c:	83 c8 09             	or     $0x9,%eax
  102a8f:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102a94:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a9b:	83 c8 10             	or     $0x10,%eax
  102a9e:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102aa3:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102aaa:	83 e0 9f             	and    $0xffffff9f,%eax
  102aad:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102ab2:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102ab9:	83 c8 80             	or     $0xffffff80,%eax
  102abc:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102ac1:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102ac8:	83 e0 f0             	and    $0xfffffff0,%eax
  102acb:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102ad0:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102ad7:	83 e0 ef             	and    $0xffffffef,%eax
  102ada:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102adf:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102ae6:	83 e0 df             	and    $0xffffffdf,%eax
  102ae9:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102aee:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102af5:	83 c8 40             	or     $0x40,%eax
  102af8:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102afd:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102b04:	83 e0 7f             	and    $0x7f,%eax
  102b07:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102b0c:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102b11:	c1 e8 18             	shr    $0x18,%eax
  102b14:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102b19:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102b20:	83 e0 ef             	and    $0xffffffef,%eax
  102b23:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102b28:	68 10 fa 10 00       	push   $0x10fa10
  102b2d:	e8 d7 fe ff ff       	call   102a09 <lgdt>
  102b32:	83 c4 04             	add    $0x4,%esp
  102b35:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102b3b:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102b3f:	0f 00 d8             	ltr    %ax
}
  102b42:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102b43:	90                   	nop
  102b44:	c9                   	leave  
  102b45:	c3                   	ret    

00102b46 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102b46:	f3 0f 1e fb          	endbr32 
  102b4a:	55                   	push   %ebp
  102b4b:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102b4d:	e8 ed fe ff ff       	call   102a3f <gdt_init>
}
  102b52:	90                   	nop
  102b53:	5d                   	pop    %ebp
  102b54:	c3                   	ret    

00102b55 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102b55:	f3 0f 1e fb          	endbr32 
  102b59:	55                   	push   %ebp
  102b5a:	89 e5                	mov    %esp,%ebp
  102b5c:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102b5f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102b66:	eb 04                	jmp    102b6c <strlen+0x17>
        cnt ++;
  102b68:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6f:	8d 50 01             	lea    0x1(%eax),%edx
  102b72:	89 55 08             	mov    %edx,0x8(%ebp)
  102b75:	0f b6 00             	movzbl (%eax),%eax
  102b78:	84 c0                	test   %al,%al
  102b7a:	75 ec                	jne    102b68 <strlen+0x13>
    }
    return cnt;
  102b7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b7f:	c9                   	leave  
  102b80:	c3                   	ret    

00102b81 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102b81:	f3 0f 1e fb          	endbr32 
  102b85:	55                   	push   %ebp
  102b86:	89 e5                	mov    %esp,%ebp
  102b88:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102b8b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b92:	eb 04                	jmp    102b98 <strnlen+0x17>
        cnt ++;
  102b94:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b98:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b9b:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102b9e:	73 10                	jae    102bb0 <strnlen+0x2f>
  102ba0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba3:	8d 50 01             	lea    0x1(%eax),%edx
  102ba6:	89 55 08             	mov    %edx,0x8(%ebp)
  102ba9:	0f b6 00             	movzbl (%eax),%eax
  102bac:	84 c0                	test   %al,%al
  102bae:	75 e4                	jne    102b94 <strnlen+0x13>
    }
    return cnt;
  102bb0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102bb3:	c9                   	leave  
  102bb4:	c3                   	ret    

00102bb5 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102bb5:	f3 0f 1e fb          	endbr32 
  102bb9:	55                   	push   %ebp
  102bba:	89 e5                	mov    %esp,%ebp
  102bbc:	57                   	push   %edi
  102bbd:	56                   	push   %esi
  102bbe:	83 ec 20             	sub    $0x20,%esp
  102bc1:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bc7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bca:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102bcd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bd3:	89 d1                	mov    %edx,%ecx
  102bd5:	89 c2                	mov    %eax,%edx
  102bd7:	89 ce                	mov    %ecx,%esi
  102bd9:	89 d7                	mov    %edx,%edi
  102bdb:	ac                   	lods   %ds:(%esi),%al
  102bdc:	aa                   	stos   %al,%es:(%edi)
  102bdd:	84 c0                	test   %al,%al
  102bdf:	75 fa                	jne    102bdb <strcpy+0x26>
  102be1:	89 fa                	mov    %edi,%edx
  102be3:	89 f1                	mov    %esi,%ecx
  102be5:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102be8:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102beb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102bee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102bf1:	83 c4 20             	add    $0x20,%esp
  102bf4:	5e                   	pop    %esi
  102bf5:	5f                   	pop    %edi
  102bf6:	5d                   	pop    %ebp
  102bf7:	c3                   	ret    

00102bf8 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102bf8:	f3 0f 1e fb          	endbr32 
  102bfc:	55                   	push   %ebp
  102bfd:	89 e5                	mov    %esp,%ebp
  102bff:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102c02:	8b 45 08             	mov    0x8(%ebp),%eax
  102c05:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102c08:	eb 21                	jmp    102c2b <strncpy+0x33>
        if ((*p = *src) != '\0') {
  102c0a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c0d:	0f b6 10             	movzbl (%eax),%edx
  102c10:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c13:	88 10                	mov    %dl,(%eax)
  102c15:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c18:	0f b6 00             	movzbl (%eax),%eax
  102c1b:	84 c0                	test   %al,%al
  102c1d:	74 04                	je     102c23 <strncpy+0x2b>
            src ++;
  102c1f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102c23:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102c27:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  102c2b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c2f:	75 d9                	jne    102c0a <strncpy+0x12>
    }
    return dst;
  102c31:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c34:	c9                   	leave  
  102c35:	c3                   	ret    

00102c36 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102c36:	f3 0f 1e fb          	endbr32 
  102c3a:	55                   	push   %ebp
  102c3b:	89 e5                	mov    %esp,%ebp
  102c3d:	57                   	push   %edi
  102c3e:	56                   	push   %esi
  102c3f:	83 ec 20             	sub    $0x20,%esp
  102c42:	8b 45 08             	mov    0x8(%ebp),%eax
  102c45:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c48:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102c4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c51:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c54:	89 d1                	mov    %edx,%ecx
  102c56:	89 c2                	mov    %eax,%edx
  102c58:	89 ce                	mov    %ecx,%esi
  102c5a:	89 d7                	mov    %edx,%edi
  102c5c:	ac                   	lods   %ds:(%esi),%al
  102c5d:	ae                   	scas   %es:(%edi),%al
  102c5e:	75 08                	jne    102c68 <strcmp+0x32>
  102c60:	84 c0                	test   %al,%al
  102c62:	75 f8                	jne    102c5c <strcmp+0x26>
  102c64:	31 c0                	xor    %eax,%eax
  102c66:	eb 04                	jmp    102c6c <strcmp+0x36>
  102c68:	19 c0                	sbb    %eax,%eax
  102c6a:	0c 01                	or     $0x1,%al
  102c6c:	89 fa                	mov    %edi,%edx
  102c6e:	89 f1                	mov    %esi,%ecx
  102c70:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c73:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102c76:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102c79:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102c7c:	83 c4 20             	add    $0x20,%esp
  102c7f:	5e                   	pop    %esi
  102c80:	5f                   	pop    %edi
  102c81:	5d                   	pop    %ebp
  102c82:	c3                   	ret    

00102c83 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102c83:	f3 0f 1e fb          	endbr32 
  102c87:	55                   	push   %ebp
  102c88:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c8a:	eb 0c                	jmp    102c98 <strncmp+0x15>
        n --, s1 ++, s2 ++;
  102c8c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102c90:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c94:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c98:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c9c:	74 1a                	je     102cb8 <strncmp+0x35>
  102c9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca1:	0f b6 00             	movzbl (%eax),%eax
  102ca4:	84 c0                	test   %al,%al
  102ca6:	74 10                	je     102cb8 <strncmp+0x35>
  102ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cab:	0f b6 10             	movzbl (%eax),%edx
  102cae:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb1:	0f b6 00             	movzbl (%eax),%eax
  102cb4:	38 c2                	cmp    %al,%dl
  102cb6:	74 d4                	je     102c8c <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102cb8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cbc:	74 18                	je     102cd6 <strncmp+0x53>
  102cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc1:	0f b6 00             	movzbl (%eax),%eax
  102cc4:	0f b6 d0             	movzbl %al,%edx
  102cc7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cca:	0f b6 00             	movzbl (%eax),%eax
  102ccd:	0f b6 c0             	movzbl %al,%eax
  102cd0:	29 c2                	sub    %eax,%edx
  102cd2:	89 d0                	mov    %edx,%eax
  102cd4:	eb 05                	jmp    102cdb <strncmp+0x58>
  102cd6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102cdb:	5d                   	pop    %ebp
  102cdc:	c3                   	ret    

00102cdd <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102cdd:	f3 0f 1e fb          	endbr32 
  102ce1:	55                   	push   %ebp
  102ce2:	89 e5                	mov    %esp,%ebp
  102ce4:	83 ec 04             	sub    $0x4,%esp
  102ce7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cea:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102ced:	eb 14                	jmp    102d03 <strchr+0x26>
        if (*s == c) {
  102cef:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf2:	0f b6 00             	movzbl (%eax),%eax
  102cf5:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102cf8:	75 05                	jne    102cff <strchr+0x22>
            return (char *)s;
  102cfa:	8b 45 08             	mov    0x8(%ebp),%eax
  102cfd:	eb 13                	jmp    102d12 <strchr+0x35>
        }
        s ++;
  102cff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102d03:	8b 45 08             	mov    0x8(%ebp),%eax
  102d06:	0f b6 00             	movzbl (%eax),%eax
  102d09:	84 c0                	test   %al,%al
  102d0b:	75 e2                	jne    102cef <strchr+0x12>
    }
    return NULL;
  102d0d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102d12:	c9                   	leave  
  102d13:	c3                   	ret    

00102d14 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102d14:	f3 0f 1e fb          	endbr32 
  102d18:	55                   	push   %ebp
  102d19:	89 e5                	mov    %esp,%ebp
  102d1b:	83 ec 04             	sub    $0x4,%esp
  102d1e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d21:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102d24:	eb 0f                	jmp    102d35 <strfind+0x21>
        if (*s == c) {
  102d26:	8b 45 08             	mov    0x8(%ebp),%eax
  102d29:	0f b6 00             	movzbl (%eax),%eax
  102d2c:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102d2f:	74 10                	je     102d41 <strfind+0x2d>
            break;
        }
        s ++;
  102d31:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102d35:	8b 45 08             	mov    0x8(%ebp),%eax
  102d38:	0f b6 00             	movzbl (%eax),%eax
  102d3b:	84 c0                	test   %al,%al
  102d3d:	75 e7                	jne    102d26 <strfind+0x12>
  102d3f:	eb 01                	jmp    102d42 <strfind+0x2e>
            break;
  102d41:	90                   	nop
    }
    return (char *)s;
  102d42:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102d45:	c9                   	leave  
  102d46:	c3                   	ret    

00102d47 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102d47:	f3 0f 1e fb          	endbr32 
  102d4b:	55                   	push   %ebp
  102d4c:	89 e5                	mov    %esp,%ebp
  102d4e:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102d51:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102d58:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102d5f:	eb 04                	jmp    102d65 <strtol+0x1e>
        s ++;
  102d61:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102d65:	8b 45 08             	mov    0x8(%ebp),%eax
  102d68:	0f b6 00             	movzbl (%eax),%eax
  102d6b:	3c 20                	cmp    $0x20,%al
  102d6d:	74 f2                	je     102d61 <strtol+0x1a>
  102d6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d72:	0f b6 00             	movzbl (%eax),%eax
  102d75:	3c 09                	cmp    $0x9,%al
  102d77:	74 e8                	je     102d61 <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102d79:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7c:	0f b6 00             	movzbl (%eax),%eax
  102d7f:	3c 2b                	cmp    $0x2b,%al
  102d81:	75 06                	jne    102d89 <strtol+0x42>
        s ++;
  102d83:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d87:	eb 15                	jmp    102d9e <strtol+0x57>
    }
    else if (*s == '-') {
  102d89:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8c:	0f b6 00             	movzbl (%eax),%eax
  102d8f:	3c 2d                	cmp    $0x2d,%al
  102d91:	75 0b                	jne    102d9e <strtol+0x57>
        s ++, neg = 1;
  102d93:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d97:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102d9e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102da2:	74 06                	je     102daa <strtol+0x63>
  102da4:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102da8:	75 24                	jne    102dce <strtol+0x87>
  102daa:	8b 45 08             	mov    0x8(%ebp),%eax
  102dad:	0f b6 00             	movzbl (%eax),%eax
  102db0:	3c 30                	cmp    $0x30,%al
  102db2:	75 1a                	jne    102dce <strtol+0x87>
  102db4:	8b 45 08             	mov    0x8(%ebp),%eax
  102db7:	83 c0 01             	add    $0x1,%eax
  102dba:	0f b6 00             	movzbl (%eax),%eax
  102dbd:	3c 78                	cmp    $0x78,%al
  102dbf:	75 0d                	jne    102dce <strtol+0x87>
        s += 2, base = 16;
  102dc1:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102dc5:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102dcc:	eb 2a                	jmp    102df8 <strtol+0xb1>
    }
    else if (base == 0 && s[0] == '0') {
  102dce:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102dd2:	75 17                	jne    102deb <strtol+0xa4>
  102dd4:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd7:	0f b6 00             	movzbl (%eax),%eax
  102dda:	3c 30                	cmp    $0x30,%al
  102ddc:	75 0d                	jne    102deb <strtol+0xa4>
        s ++, base = 8;
  102dde:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102de2:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102de9:	eb 0d                	jmp    102df8 <strtol+0xb1>
    }
    else if (base == 0) {
  102deb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102def:	75 07                	jne    102df8 <strtol+0xb1>
        base = 10;
  102df1:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102df8:	8b 45 08             	mov    0x8(%ebp),%eax
  102dfb:	0f b6 00             	movzbl (%eax),%eax
  102dfe:	3c 2f                	cmp    $0x2f,%al
  102e00:	7e 1b                	jle    102e1d <strtol+0xd6>
  102e02:	8b 45 08             	mov    0x8(%ebp),%eax
  102e05:	0f b6 00             	movzbl (%eax),%eax
  102e08:	3c 39                	cmp    $0x39,%al
  102e0a:	7f 11                	jg     102e1d <strtol+0xd6>
            dig = *s - '0';
  102e0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0f:	0f b6 00             	movzbl (%eax),%eax
  102e12:	0f be c0             	movsbl %al,%eax
  102e15:	83 e8 30             	sub    $0x30,%eax
  102e18:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e1b:	eb 48                	jmp    102e65 <strtol+0x11e>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102e1d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e20:	0f b6 00             	movzbl (%eax),%eax
  102e23:	3c 60                	cmp    $0x60,%al
  102e25:	7e 1b                	jle    102e42 <strtol+0xfb>
  102e27:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2a:	0f b6 00             	movzbl (%eax),%eax
  102e2d:	3c 7a                	cmp    $0x7a,%al
  102e2f:	7f 11                	jg     102e42 <strtol+0xfb>
            dig = *s - 'a' + 10;
  102e31:	8b 45 08             	mov    0x8(%ebp),%eax
  102e34:	0f b6 00             	movzbl (%eax),%eax
  102e37:	0f be c0             	movsbl %al,%eax
  102e3a:	83 e8 57             	sub    $0x57,%eax
  102e3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e40:	eb 23                	jmp    102e65 <strtol+0x11e>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102e42:	8b 45 08             	mov    0x8(%ebp),%eax
  102e45:	0f b6 00             	movzbl (%eax),%eax
  102e48:	3c 40                	cmp    $0x40,%al
  102e4a:	7e 3c                	jle    102e88 <strtol+0x141>
  102e4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4f:	0f b6 00             	movzbl (%eax),%eax
  102e52:	3c 5a                	cmp    $0x5a,%al
  102e54:	7f 32                	jg     102e88 <strtol+0x141>
            dig = *s - 'A' + 10;
  102e56:	8b 45 08             	mov    0x8(%ebp),%eax
  102e59:	0f b6 00             	movzbl (%eax),%eax
  102e5c:	0f be c0             	movsbl %al,%eax
  102e5f:	83 e8 37             	sub    $0x37,%eax
  102e62:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102e65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e68:	3b 45 10             	cmp    0x10(%ebp),%eax
  102e6b:	7d 1a                	jge    102e87 <strtol+0x140>
            break;
        }
        s ++, val = (val * base) + dig;
  102e6d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102e71:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e74:	0f af 45 10          	imul   0x10(%ebp),%eax
  102e78:	89 c2                	mov    %eax,%edx
  102e7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e7d:	01 d0                	add    %edx,%eax
  102e7f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102e82:	e9 71 ff ff ff       	jmp    102df8 <strtol+0xb1>
            break;
  102e87:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102e88:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e8c:	74 08                	je     102e96 <strtol+0x14f>
        *endptr = (char *) s;
  102e8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e91:	8b 55 08             	mov    0x8(%ebp),%edx
  102e94:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102e96:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102e9a:	74 07                	je     102ea3 <strtol+0x15c>
  102e9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e9f:	f7 d8                	neg    %eax
  102ea1:	eb 03                	jmp    102ea6 <strtol+0x15f>
  102ea3:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102ea6:	c9                   	leave  
  102ea7:	c3                   	ret    

00102ea8 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102ea8:	f3 0f 1e fb          	endbr32 
  102eac:	55                   	push   %ebp
  102ead:	89 e5                	mov    %esp,%ebp
  102eaf:	57                   	push   %edi
  102eb0:	83 ec 24             	sub    $0x24,%esp
  102eb3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb6:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102eb9:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102ebd:	8b 55 08             	mov    0x8(%ebp),%edx
  102ec0:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102ec3:	88 45 f7             	mov    %al,-0x9(%ebp)
  102ec6:	8b 45 10             	mov    0x10(%ebp),%eax
  102ec9:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102ecc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102ecf:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102ed3:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102ed6:	89 d7                	mov    %edx,%edi
  102ed8:	f3 aa                	rep stos %al,%es:(%edi)
  102eda:	89 fa                	mov    %edi,%edx
  102edc:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102edf:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102ee2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102ee5:	83 c4 24             	add    $0x24,%esp
  102ee8:	5f                   	pop    %edi
  102ee9:	5d                   	pop    %ebp
  102eea:	c3                   	ret    

00102eeb <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102eeb:	f3 0f 1e fb          	endbr32 
  102eef:	55                   	push   %ebp
  102ef0:	89 e5                	mov    %esp,%ebp
  102ef2:	57                   	push   %edi
  102ef3:	56                   	push   %esi
  102ef4:	53                   	push   %ebx
  102ef5:	83 ec 30             	sub    $0x30,%esp
  102ef8:	8b 45 08             	mov    0x8(%ebp),%eax
  102efb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102efe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f01:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f04:	8b 45 10             	mov    0x10(%ebp),%eax
  102f07:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102f0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f0d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102f10:	73 42                	jae    102f54 <memmove+0x69>
  102f12:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f18:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f1b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f1e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f21:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102f24:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102f27:	c1 e8 02             	shr    $0x2,%eax
  102f2a:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102f2c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102f2f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f32:	89 d7                	mov    %edx,%edi
  102f34:	89 c6                	mov    %eax,%esi
  102f36:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102f38:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102f3b:	83 e1 03             	and    $0x3,%ecx
  102f3e:	74 02                	je     102f42 <memmove+0x57>
  102f40:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f42:	89 f0                	mov    %esi,%eax
  102f44:	89 fa                	mov    %edi,%edx
  102f46:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102f49:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102f4c:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102f4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102f52:	eb 36                	jmp    102f8a <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102f54:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f57:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f5d:	01 c2                	add    %eax,%edx
  102f5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f62:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102f65:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f68:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102f6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f6e:	89 c1                	mov    %eax,%ecx
  102f70:	89 d8                	mov    %ebx,%eax
  102f72:	89 d6                	mov    %edx,%esi
  102f74:	89 c7                	mov    %eax,%edi
  102f76:	fd                   	std    
  102f77:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f79:	fc                   	cld    
  102f7a:	89 f8                	mov    %edi,%eax
  102f7c:	89 f2                	mov    %esi,%edx
  102f7e:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102f81:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102f84:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102f87:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102f8a:	83 c4 30             	add    $0x30,%esp
  102f8d:	5b                   	pop    %ebx
  102f8e:	5e                   	pop    %esi
  102f8f:	5f                   	pop    %edi
  102f90:	5d                   	pop    %ebp
  102f91:	c3                   	ret    

00102f92 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102f92:	f3 0f 1e fb          	endbr32 
  102f96:	55                   	push   %ebp
  102f97:	89 e5                	mov    %esp,%ebp
  102f99:	57                   	push   %edi
  102f9a:	56                   	push   %esi
  102f9b:	83 ec 20             	sub    $0x20,%esp
  102f9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fa4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fa7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102faa:	8b 45 10             	mov    0x10(%ebp),%eax
  102fad:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102fb0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fb3:	c1 e8 02             	shr    $0x2,%eax
  102fb6:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102fb8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fbe:	89 d7                	mov    %edx,%edi
  102fc0:	89 c6                	mov    %eax,%esi
  102fc2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102fc4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102fc7:	83 e1 03             	and    $0x3,%ecx
  102fca:	74 02                	je     102fce <memcpy+0x3c>
  102fcc:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102fce:	89 f0                	mov    %esi,%eax
  102fd0:	89 fa                	mov    %edi,%edx
  102fd2:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102fd5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102fd8:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102fdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102fde:	83 c4 20             	add    $0x20,%esp
  102fe1:	5e                   	pop    %esi
  102fe2:	5f                   	pop    %edi
  102fe3:	5d                   	pop    %ebp
  102fe4:	c3                   	ret    

00102fe5 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102fe5:	f3 0f 1e fb          	endbr32 
  102fe9:	55                   	push   %ebp
  102fea:	89 e5                	mov    %esp,%ebp
  102fec:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102fef:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102ff5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ff8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102ffb:	eb 30                	jmp    10302d <memcmp+0x48>
        if (*s1 != *s2) {
  102ffd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103000:	0f b6 10             	movzbl (%eax),%edx
  103003:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103006:	0f b6 00             	movzbl (%eax),%eax
  103009:	38 c2                	cmp    %al,%dl
  10300b:	74 18                	je     103025 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10300d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103010:	0f b6 00             	movzbl (%eax),%eax
  103013:	0f b6 d0             	movzbl %al,%edx
  103016:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103019:	0f b6 00             	movzbl (%eax),%eax
  10301c:	0f b6 c0             	movzbl %al,%eax
  10301f:	29 c2                	sub    %eax,%edx
  103021:	89 d0                	mov    %edx,%eax
  103023:	eb 1a                	jmp    10303f <memcmp+0x5a>
        }
        s1 ++, s2 ++;
  103025:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103029:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  10302d:	8b 45 10             	mov    0x10(%ebp),%eax
  103030:	8d 50 ff             	lea    -0x1(%eax),%edx
  103033:	89 55 10             	mov    %edx,0x10(%ebp)
  103036:	85 c0                	test   %eax,%eax
  103038:	75 c3                	jne    102ffd <memcmp+0x18>
    }
    return 0;
  10303a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10303f:	c9                   	leave  
  103040:	c3                   	ret    

00103041 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  103041:	f3 0f 1e fb          	endbr32 
  103045:	55                   	push   %ebp
  103046:	89 e5                	mov    %esp,%ebp
  103048:	83 ec 38             	sub    $0x38,%esp
  10304b:	8b 45 10             	mov    0x10(%ebp),%eax
  10304e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  103051:	8b 45 14             	mov    0x14(%ebp),%eax
  103054:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  103057:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10305a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10305d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103060:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  103063:	8b 45 18             	mov    0x18(%ebp),%eax
  103066:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103069:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10306c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10306f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103072:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103075:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103078:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10307b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10307f:	74 1c                	je     10309d <printnum+0x5c>
  103081:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103084:	ba 00 00 00 00       	mov    $0x0,%edx
  103089:	f7 75 e4             	divl   -0x1c(%ebp)
  10308c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10308f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103092:	ba 00 00 00 00       	mov    $0x0,%edx
  103097:	f7 75 e4             	divl   -0x1c(%ebp)
  10309a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10309d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030a3:	f7 75 e4             	divl   -0x1c(%ebp)
  1030a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1030a9:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1030ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030af:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1030b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030b5:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1030b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1030bb:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1030be:	8b 45 18             	mov    0x18(%ebp),%eax
  1030c1:	ba 00 00 00 00       	mov    $0x0,%edx
  1030c6:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  1030c9:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  1030cc:	19 d1                	sbb    %edx,%ecx
  1030ce:	72 37                	jb     103107 <printnum+0xc6>
        printnum(putch, putdat, result, base, width - 1, padc);
  1030d0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1030d3:	83 e8 01             	sub    $0x1,%eax
  1030d6:	83 ec 04             	sub    $0x4,%esp
  1030d9:	ff 75 20             	pushl  0x20(%ebp)
  1030dc:	50                   	push   %eax
  1030dd:	ff 75 18             	pushl  0x18(%ebp)
  1030e0:	ff 75 ec             	pushl  -0x14(%ebp)
  1030e3:	ff 75 e8             	pushl  -0x18(%ebp)
  1030e6:	ff 75 0c             	pushl  0xc(%ebp)
  1030e9:	ff 75 08             	pushl  0x8(%ebp)
  1030ec:	e8 50 ff ff ff       	call   103041 <printnum>
  1030f1:	83 c4 20             	add    $0x20,%esp
  1030f4:	eb 1b                	jmp    103111 <printnum+0xd0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1030f6:	83 ec 08             	sub    $0x8,%esp
  1030f9:	ff 75 0c             	pushl  0xc(%ebp)
  1030fc:	ff 75 20             	pushl  0x20(%ebp)
  1030ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103102:	ff d0                	call   *%eax
  103104:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  103107:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  10310b:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10310f:	7f e5                	jg     1030f6 <printnum+0xb5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103111:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103114:	05 30 3e 10 00       	add    $0x103e30,%eax
  103119:	0f b6 00             	movzbl (%eax),%eax
  10311c:	0f be c0             	movsbl %al,%eax
  10311f:	83 ec 08             	sub    $0x8,%esp
  103122:	ff 75 0c             	pushl  0xc(%ebp)
  103125:	50                   	push   %eax
  103126:	8b 45 08             	mov    0x8(%ebp),%eax
  103129:	ff d0                	call   *%eax
  10312b:	83 c4 10             	add    $0x10,%esp
}
  10312e:	90                   	nop
  10312f:	c9                   	leave  
  103130:	c3                   	ret    

00103131 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103131:	f3 0f 1e fb          	endbr32 
  103135:	55                   	push   %ebp
  103136:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103138:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10313c:	7e 14                	jle    103152 <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  10313e:	8b 45 08             	mov    0x8(%ebp),%eax
  103141:	8b 00                	mov    (%eax),%eax
  103143:	8d 48 08             	lea    0x8(%eax),%ecx
  103146:	8b 55 08             	mov    0x8(%ebp),%edx
  103149:	89 0a                	mov    %ecx,(%edx)
  10314b:	8b 50 04             	mov    0x4(%eax),%edx
  10314e:	8b 00                	mov    (%eax),%eax
  103150:	eb 30                	jmp    103182 <getuint+0x51>
    }
    else if (lflag) {
  103152:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103156:	74 16                	je     10316e <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  103158:	8b 45 08             	mov    0x8(%ebp),%eax
  10315b:	8b 00                	mov    (%eax),%eax
  10315d:	8d 48 04             	lea    0x4(%eax),%ecx
  103160:	8b 55 08             	mov    0x8(%ebp),%edx
  103163:	89 0a                	mov    %ecx,(%edx)
  103165:	8b 00                	mov    (%eax),%eax
  103167:	ba 00 00 00 00       	mov    $0x0,%edx
  10316c:	eb 14                	jmp    103182 <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  10316e:	8b 45 08             	mov    0x8(%ebp),%eax
  103171:	8b 00                	mov    (%eax),%eax
  103173:	8d 48 04             	lea    0x4(%eax),%ecx
  103176:	8b 55 08             	mov    0x8(%ebp),%edx
  103179:	89 0a                	mov    %ecx,(%edx)
  10317b:	8b 00                	mov    (%eax),%eax
  10317d:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103182:	5d                   	pop    %ebp
  103183:	c3                   	ret    

00103184 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103184:	f3 0f 1e fb          	endbr32 
  103188:	55                   	push   %ebp
  103189:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10318b:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10318f:	7e 14                	jle    1031a5 <getint+0x21>
        return va_arg(*ap, long long);
  103191:	8b 45 08             	mov    0x8(%ebp),%eax
  103194:	8b 00                	mov    (%eax),%eax
  103196:	8d 48 08             	lea    0x8(%eax),%ecx
  103199:	8b 55 08             	mov    0x8(%ebp),%edx
  10319c:	89 0a                	mov    %ecx,(%edx)
  10319e:	8b 50 04             	mov    0x4(%eax),%edx
  1031a1:	8b 00                	mov    (%eax),%eax
  1031a3:	eb 28                	jmp    1031cd <getint+0x49>
    }
    else if (lflag) {
  1031a5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1031a9:	74 12                	je     1031bd <getint+0x39>
        return va_arg(*ap, long);
  1031ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ae:	8b 00                	mov    (%eax),%eax
  1031b0:	8d 48 04             	lea    0x4(%eax),%ecx
  1031b3:	8b 55 08             	mov    0x8(%ebp),%edx
  1031b6:	89 0a                	mov    %ecx,(%edx)
  1031b8:	8b 00                	mov    (%eax),%eax
  1031ba:	99                   	cltd   
  1031bb:	eb 10                	jmp    1031cd <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  1031bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c0:	8b 00                	mov    (%eax),%eax
  1031c2:	8d 48 04             	lea    0x4(%eax),%ecx
  1031c5:	8b 55 08             	mov    0x8(%ebp),%edx
  1031c8:	89 0a                	mov    %ecx,(%edx)
  1031ca:	8b 00                	mov    (%eax),%eax
  1031cc:	99                   	cltd   
    }
}
  1031cd:	5d                   	pop    %ebp
  1031ce:	c3                   	ret    

001031cf <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1031cf:	f3 0f 1e fb          	endbr32 
  1031d3:	55                   	push   %ebp
  1031d4:	89 e5                	mov    %esp,%ebp
  1031d6:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  1031d9:	8d 45 14             	lea    0x14(%ebp),%eax
  1031dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1031df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1031e2:	50                   	push   %eax
  1031e3:	ff 75 10             	pushl  0x10(%ebp)
  1031e6:	ff 75 0c             	pushl  0xc(%ebp)
  1031e9:	ff 75 08             	pushl  0x8(%ebp)
  1031ec:	e8 06 00 00 00       	call   1031f7 <vprintfmt>
  1031f1:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  1031f4:	90                   	nop
  1031f5:	c9                   	leave  
  1031f6:	c3                   	ret    

001031f7 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1031f7:	f3 0f 1e fb          	endbr32 
  1031fb:	55                   	push   %ebp
  1031fc:	89 e5                	mov    %esp,%ebp
  1031fe:	56                   	push   %esi
  1031ff:	53                   	push   %ebx
  103200:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103203:	eb 17                	jmp    10321c <vprintfmt+0x25>
            if (ch == '\0') {
  103205:	85 db                	test   %ebx,%ebx
  103207:	0f 84 8f 03 00 00    	je     10359c <vprintfmt+0x3a5>
                return;
            }
            putch(ch, putdat);
  10320d:	83 ec 08             	sub    $0x8,%esp
  103210:	ff 75 0c             	pushl  0xc(%ebp)
  103213:	53                   	push   %ebx
  103214:	8b 45 08             	mov    0x8(%ebp),%eax
  103217:	ff d0                	call   *%eax
  103219:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10321c:	8b 45 10             	mov    0x10(%ebp),%eax
  10321f:	8d 50 01             	lea    0x1(%eax),%edx
  103222:	89 55 10             	mov    %edx,0x10(%ebp)
  103225:	0f b6 00             	movzbl (%eax),%eax
  103228:	0f b6 d8             	movzbl %al,%ebx
  10322b:	83 fb 25             	cmp    $0x25,%ebx
  10322e:	75 d5                	jne    103205 <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  103230:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103234:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10323b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10323e:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103241:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103248:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10324b:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10324e:	8b 45 10             	mov    0x10(%ebp),%eax
  103251:	8d 50 01             	lea    0x1(%eax),%edx
  103254:	89 55 10             	mov    %edx,0x10(%ebp)
  103257:	0f b6 00             	movzbl (%eax),%eax
  10325a:	0f b6 d8             	movzbl %al,%ebx
  10325d:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103260:	83 f8 55             	cmp    $0x55,%eax
  103263:	0f 87 06 03 00 00    	ja     10356f <vprintfmt+0x378>
  103269:	8b 04 85 54 3e 10 00 	mov    0x103e54(,%eax,4),%eax
  103270:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103273:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103277:	eb d5                	jmp    10324e <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103279:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  10327d:	eb cf                	jmp    10324e <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  10327f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  103286:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103289:	89 d0                	mov    %edx,%eax
  10328b:	c1 e0 02             	shl    $0x2,%eax
  10328e:	01 d0                	add    %edx,%eax
  103290:	01 c0                	add    %eax,%eax
  103292:	01 d8                	add    %ebx,%eax
  103294:	83 e8 30             	sub    $0x30,%eax
  103297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10329a:	8b 45 10             	mov    0x10(%ebp),%eax
  10329d:	0f b6 00             	movzbl (%eax),%eax
  1032a0:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1032a3:	83 fb 2f             	cmp    $0x2f,%ebx
  1032a6:	7e 39                	jle    1032e1 <vprintfmt+0xea>
  1032a8:	83 fb 39             	cmp    $0x39,%ebx
  1032ab:	7f 34                	jg     1032e1 <vprintfmt+0xea>
            for (precision = 0; ; ++ fmt) {
  1032ad:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1032b1:	eb d3                	jmp    103286 <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1032b3:	8b 45 14             	mov    0x14(%ebp),%eax
  1032b6:	8d 50 04             	lea    0x4(%eax),%edx
  1032b9:	89 55 14             	mov    %edx,0x14(%ebp)
  1032bc:	8b 00                	mov    (%eax),%eax
  1032be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1032c1:	eb 1f                	jmp    1032e2 <vprintfmt+0xeb>

        case '.':
            if (width < 0)
  1032c3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032c7:	79 85                	jns    10324e <vprintfmt+0x57>
                width = 0;
  1032c9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1032d0:	e9 79 ff ff ff       	jmp    10324e <vprintfmt+0x57>

        case '#':
            altflag = 1;
  1032d5:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1032dc:	e9 6d ff ff ff       	jmp    10324e <vprintfmt+0x57>
            goto process_precision;
  1032e1:	90                   	nop

        process_precision:
            if (width < 0)
  1032e2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032e6:	0f 89 62 ff ff ff    	jns    10324e <vprintfmt+0x57>
                width = precision, precision = -1;
  1032ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032f2:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1032f9:	e9 50 ff ff ff       	jmp    10324e <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1032fe:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  103302:	e9 47 ff ff ff       	jmp    10324e <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103307:	8b 45 14             	mov    0x14(%ebp),%eax
  10330a:	8d 50 04             	lea    0x4(%eax),%edx
  10330d:	89 55 14             	mov    %edx,0x14(%ebp)
  103310:	8b 00                	mov    (%eax),%eax
  103312:	83 ec 08             	sub    $0x8,%esp
  103315:	ff 75 0c             	pushl  0xc(%ebp)
  103318:	50                   	push   %eax
  103319:	8b 45 08             	mov    0x8(%ebp),%eax
  10331c:	ff d0                	call   *%eax
  10331e:	83 c4 10             	add    $0x10,%esp
            break;
  103321:	e9 71 02 00 00       	jmp    103597 <vprintfmt+0x3a0>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103326:	8b 45 14             	mov    0x14(%ebp),%eax
  103329:	8d 50 04             	lea    0x4(%eax),%edx
  10332c:	89 55 14             	mov    %edx,0x14(%ebp)
  10332f:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103331:	85 db                	test   %ebx,%ebx
  103333:	79 02                	jns    103337 <vprintfmt+0x140>
                err = -err;
  103335:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103337:	83 fb 06             	cmp    $0x6,%ebx
  10333a:	7f 0b                	jg     103347 <vprintfmt+0x150>
  10333c:	8b 34 9d 14 3e 10 00 	mov    0x103e14(,%ebx,4),%esi
  103343:	85 f6                	test   %esi,%esi
  103345:	75 19                	jne    103360 <vprintfmt+0x169>
                printfmt(putch, putdat, "error %d", err);
  103347:	53                   	push   %ebx
  103348:	68 41 3e 10 00       	push   $0x103e41
  10334d:	ff 75 0c             	pushl  0xc(%ebp)
  103350:	ff 75 08             	pushl  0x8(%ebp)
  103353:	e8 77 fe ff ff       	call   1031cf <printfmt>
  103358:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  10335b:	e9 37 02 00 00       	jmp    103597 <vprintfmt+0x3a0>
                printfmt(putch, putdat, "%s", p);
  103360:	56                   	push   %esi
  103361:	68 4a 3e 10 00       	push   $0x103e4a
  103366:	ff 75 0c             	pushl  0xc(%ebp)
  103369:	ff 75 08             	pushl  0x8(%ebp)
  10336c:	e8 5e fe ff ff       	call   1031cf <printfmt>
  103371:	83 c4 10             	add    $0x10,%esp
            break;
  103374:	e9 1e 02 00 00       	jmp    103597 <vprintfmt+0x3a0>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103379:	8b 45 14             	mov    0x14(%ebp),%eax
  10337c:	8d 50 04             	lea    0x4(%eax),%edx
  10337f:	89 55 14             	mov    %edx,0x14(%ebp)
  103382:	8b 30                	mov    (%eax),%esi
  103384:	85 f6                	test   %esi,%esi
  103386:	75 05                	jne    10338d <vprintfmt+0x196>
                p = "(null)";
  103388:	be 4d 3e 10 00       	mov    $0x103e4d,%esi
            }
            if (width > 0 && padc != '-') {
  10338d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103391:	7e 76                	jle    103409 <vprintfmt+0x212>
  103393:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103397:	74 70                	je     103409 <vprintfmt+0x212>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103399:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10339c:	83 ec 08             	sub    $0x8,%esp
  10339f:	50                   	push   %eax
  1033a0:	56                   	push   %esi
  1033a1:	e8 db f7 ff ff       	call   102b81 <strnlen>
  1033a6:	83 c4 10             	add    $0x10,%esp
  1033a9:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1033ac:	29 c2                	sub    %eax,%edx
  1033ae:	89 d0                	mov    %edx,%eax
  1033b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1033b3:	eb 17                	jmp    1033cc <vprintfmt+0x1d5>
                    putch(padc, putdat);
  1033b5:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1033b9:	83 ec 08             	sub    $0x8,%esp
  1033bc:	ff 75 0c             	pushl  0xc(%ebp)
  1033bf:	50                   	push   %eax
  1033c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c3:	ff d0                	call   *%eax
  1033c5:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  1033c8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1033cc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033d0:	7f e3                	jg     1033b5 <vprintfmt+0x1be>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1033d2:	eb 35                	jmp    103409 <vprintfmt+0x212>
                if (altflag && (ch < ' ' || ch > '~')) {
  1033d4:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1033d8:	74 1c                	je     1033f6 <vprintfmt+0x1ff>
  1033da:	83 fb 1f             	cmp    $0x1f,%ebx
  1033dd:	7e 05                	jle    1033e4 <vprintfmt+0x1ed>
  1033df:	83 fb 7e             	cmp    $0x7e,%ebx
  1033e2:	7e 12                	jle    1033f6 <vprintfmt+0x1ff>
                    putch('?', putdat);
  1033e4:	83 ec 08             	sub    $0x8,%esp
  1033e7:	ff 75 0c             	pushl  0xc(%ebp)
  1033ea:	6a 3f                	push   $0x3f
  1033ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ef:	ff d0                	call   *%eax
  1033f1:	83 c4 10             	add    $0x10,%esp
  1033f4:	eb 0f                	jmp    103405 <vprintfmt+0x20e>
                }
                else {
                    putch(ch, putdat);
  1033f6:	83 ec 08             	sub    $0x8,%esp
  1033f9:	ff 75 0c             	pushl  0xc(%ebp)
  1033fc:	53                   	push   %ebx
  1033fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103400:	ff d0                	call   *%eax
  103402:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103405:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103409:	89 f0                	mov    %esi,%eax
  10340b:	8d 70 01             	lea    0x1(%eax),%esi
  10340e:	0f b6 00             	movzbl (%eax),%eax
  103411:	0f be d8             	movsbl %al,%ebx
  103414:	85 db                	test   %ebx,%ebx
  103416:	74 26                	je     10343e <vprintfmt+0x247>
  103418:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10341c:	78 b6                	js     1033d4 <vprintfmt+0x1dd>
  10341e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  103422:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103426:	79 ac                	jns    1033d4 <vprintfmt+0x1dd>
                }
            }
            for (; width > 0; width --) {
  103428:	eb 14                	jmp    10343e <vprintfmt+0x247>
                putch(' ', putdat);
  10342a:	83 ec 08             	sub    $0x8,%esp
  10342d:	ff 75 0c             	pushl  0xc(%ebp)
  103430:	6a 20                	push   $0x20
  103432:	8b 45 08             	mov    0x8(%ebp),%eax
  103435:	ff d0                	call   *%eax
  103437:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  10343a:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10343e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103442:	7f e6                	jg     10342a <vprintfmt+0x233>
            }
            break;
  103444:	e9 4e 01 00 00       	jmp    103597 <vprintfmt+0x3a0>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103449:	83 ec 08             	sub    $0x8,%esp
  10344c:	ff 75 e0             	pushl  -0x20(%ebp)
  10344f:	8d 45 14             	lea    0x14(%ebp),%eax
  103452:	50                   	push   %eax
  103453:	e8 2c fd ff ff       	call   103184 <getint>
  103458:	83 c4 10             	add    $0x10,%esp
  10345b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10345e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103461:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103464:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103467:	85 d2                	test   %edx,%edx
  103469:	79 23                	jns    10348e <vprintfmt+0x297>
                putch('-', putdat);
  10346b:	83 ec 08             	sub    $0x8,%esp
  10346e:	ff 75 0c             	pushl  0xc(%ebp)
  103471:	6a 2d                	push   $0x2d
  103473:	8b 45 08             	mov    0x8(%ebp),%eax
  103476:	ff d0                	call   *%eax
  103478:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  10347b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10347e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103481:	f7 d8                	neg    %eax
  103483:	83 d2 00             	adc    $0x0,%edx
  103486:	f7 da                	neg    %edx
  103488:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10348b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10348e:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103495:	e9 9f 00 00 00       	jmp    103539 <vprintfmt+0x342>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  10349a:	83 ec 08             	sub    $0x8,%esp
  10349d:	ff 75 e0             	pushl  -0x20(%ebp)
  1034a0:	8d 45 14             	lea    0x14(%ebp),%eax
  1034a3:	50                   	push   %eax
  1034a4:	e8 88 fc ff ff       	call   103131 <getuint>
  1034a9:	83 c4 10             	add    $0x10,%esp
  1034ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034af:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1034b2:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1034b9:	eb 7e                	jmp    103539 <vprintfmt+0x342>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1034bb:	83 ec 08             	sub    $0x8,%esp
  1034be:	ff 75 e0             	pushl  -0x20(%ebp)
  1034c1:	8d 45 14             	lea    0x14(%ebp),%eax
  1034c4:	50                   	push   %eax
  1034c5:	e8 67 fc ff ff       	call   103131 <getuint>
  1034ca:	83 c4 10             	add    $0x10,%esp
  1034cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1034d3:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1034da:	eb 5d                	jmp    103539 <vprintfmt+0x342>

        // pointer
        case 'p':
            putch('0', putdat);
  1034dc:	83 ec 08             	sub    $0x8,%esp
  1034df:	ff 75 0c             	pushl  0xc(%ebp)
  1034e2:	6a 30                	push   $0x30
  1034e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e7:	ff d0                	call   *%eax
  1034e9:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1034ec:	83 ec 08             	sub    $0x8,%esp
  1034ef:	ff 75 0c             	pushl  0xc(%ebp)
  1034f2:	6a 78                	push   $0x78
  1034f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f7:	ff d0                	call   *%eax
  1034f9:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1034fc:	8b 45 14             	mov    0x14(%ebp),%eax
  1034ff:	8d 50 04             	lea    0x4(%eax),%edx
  103502:	89 55 14             	mov    %edx,0x14(%ebp)
  103505:	8b 00                	mov    (%eax),%eax
  103507:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10350a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103511:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103518:	eb 1f                	jmp    103539 <vprintfmt+0x342>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10351a:	83 ec 08             	sub    $0x8,%esp
  10351d:	ff 75 e0             	pushl  -0x20(%ebp)
  103520:	8d 45 14             	lea    0x14(%ebp),%eax
  103523:	50                   	push   %eax
  103524:	e8 08 fc ff ff       	call   103131 <getuint>
  103529:	83 c4 10             	add    $0x10,%esp
  10352c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10352f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103532:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103539:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10353d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103540:	83 ec 04             	sub    $0x4,%esp
  103543:	52                   	push   %edx
  103544:	ff 75 e8             	pushl  -0x18(%ebp)
  103547:	50                   	push   %eax
  103548:	ff 75 f4             	pushl  -0xc(%ebp)
  10354b:	ff 75 f0             	pushl  -0x10(%ebp)
  10354e:	ff 75 0c             	pushl  0xc(%ebp)
  103551:	ff 75 08             	pushl  0x8(%ebp)
  103554:	e8 e8 fa ff ff       	call   103041 <printnum>
  103559:	83 c4 20             	add    $0x20,%esp
            break;
  10355c:	eb 39                	jmp    103597 <vprintfmt+0x3a0>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  10355e:	83 ec 08             	sub    $0x8,%esp
  103561:	ff 75 0c             	pushl  0xc(%ebp)
  103564:	53                   	push   %ebx
  103565:	8b 45 08             	mov    0x8(%ebp),%eax
  103568:	ff d0                	call   *%eax
  10356a:	83 c4 10             	add    $0x10,%esp
            break;
  10356d:	eb 28                	jmp    103597 <vprintfmt+0x3a0>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10356f:	83 ec 08             	sub    $0x8,%esp
  103572:	ff 75 0c             	pushl  0xc(%ebp)
  103575:	6a 25                	push   $0x25
  103577:	8b 45 08             	mov    0x8(%ebp),%eax
  10357a:	ff d0                	call   *%eax
  10357c:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  10357f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103583:	eb 04                	jmp    103589 <vprintfmt+0x392>
  103585:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103589:	8b 45 10             	mov    0x10(%ebp),%eax
  10358c:	83 e8 01             	sub    $0x1,%eax
  10358f:	0f b6 00             	movzbl (%eax),%eax
  103592:	3c 25                	cmp    $0x25,%al
  103594:	75 ef                	jne    103585 <vprintfmt+0x38e>
                /* do nothing */;
            break;
  103596:	90                   	nop
    while (1) {
  103597:	e9 67 fc ff ff       	jmp    103203 <vprintfmt+0xc>
                return;
  10359c:	90                   	nop
        }
    }
}
  10359d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1035a0:	5b                   	pop    %ebx
  1035a1:	5e                   	pop    %esi
  1035a2:	5d                   	pop    %ebp
  1035a3:	c3                   	ret    

001035a4 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1035a4:	f3 0f 1e fb          	endbr32 
  1035a8:	55                   	push   %ebp
  1035a9:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1035ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035ae:	8b 40 08             	mov    0x8(%eax),%eax
  1035b1:	8d 50 01             	lea    0x1(%eax),%edx
  1035b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035b7:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1035ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035bd:	8b 10                	mov    (%eax),%edx
  1035bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035c2:	8b 40 04             	mov    0x4(%eax),%eax
  1035c5:	39 c2                	cmp    %eax,%edx
  1035c7:	73 12                	jae    1035db <sprintputch+0x37>
        *b->buf ++ = ch;
  1035c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035cc:	8b 00                	mov    (%eax),%eax
  1035ce:	8d 48 01             	lea    0x1(%eax),%ecx
  1035d1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1035d4:	89 0a                	mov    %ecx,(%edx)
  1035d6:	8b 55 08             	mov    0x8(%ebp),%edx
  1035d9:	88 10                	mov    %dl,(%eax)
    }
}
  1035db:	90                   	nop
  1035dc:	5d                   	pop    %ebp
  1035dd:	c3                   	ret    

001035de <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1035de:	f3 0f 1e fb          	endbr32 
  1035e2:	55                   	push   %ebp
  1035e3:	89 e5                	mov    %esp,%ebp
  1035e5:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1035e8:	8d 45 14             	lea    0x14(%ebp),%eax
  1035eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1035ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035f1:	50                   	push   %eax
  1035f2:	ff 75 10             	pushl  0x10(%ebp)
  1035f5:	ff 75 0c             	pushl  0xc(%ebp)
  1035f8:	ff 75 08             	pushl  0x8(%ebp)
  1035fb:	e8 0b 00 00 00       	call   10360b <vsnprintf>
  103600:	83 c4 10             	add    $0x10,%esp
  103603:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103606:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103609:	c9                   	leave  
  10360a:	c3                   	ret    

0010360b <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10360b:	f3 0f 1e fb          	endbr32 
  10360f:	55                   	push   %ebp
  103610:	89 e5                	mov    %esp,%ebp
  103612:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103615:	8b 45 08             	mov    0x8(%ebp),%eax
  103618:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10361b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10361e:	8d 50 ff             	lea    -0x1(%eax),%edx
  103621:	8b 45 08             	mov    0x8(%ebp),%eax
  103624:	01 d0                	add    %edx,%eax
  103626:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103629:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103630:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103634:	74 0a                	je     103640 <vsnprintf+0x35>
  103636:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103639:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10363c:	39 c2                	cmp    %eax,%edx
  10363e:	76 07                	jbe    103647 <vsnprintf+0x3c>
        return -E_INVAL;
  103640:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103645:	eb 20                	jmp    103667 <vsnprintf+0x5c>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103647:	ff 75 14             	pushl  0x14(%ebp)
  10364a:	ff 75 10             	pushl  0x10(%ebp)
  10364d:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103650:	50                   	push   %eax
  103651:	68 a4 35 10 00       	push   $0x1035a4
  103656:	e8 9c fb ff ff       	call   1031f7 <vprintfmt>
  10365b:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10365e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103661:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103664:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103667:	c9                   	leave  
  103668:	c3                   	ret    
