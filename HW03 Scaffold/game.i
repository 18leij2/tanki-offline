# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 36 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 65 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 84 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 115 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "game.c" 2
# 1 "game.h" 1


typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int lives;
    int iframes;
    int direction;
    int fired;
    int powered;
    int speed;
    unsigned short color;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int fired;
    unsigned short color;
    int active;
    int erased;
} ENEMY;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int direction;
    int speed;
    int playerBullet;
    unsigned short color;
    int active;
    int erased;
} BULLET;






extern PLAYER player;
extern BULLET bullets[10];
extern ENEMY enemies[5];
extern int score;
extern int time;
extern int lives;


void initGame();
void initPlayer();
void initBullets();
void initEnemies();
void updateGame();
void updatePlayer();
void updateEnemies(ENEMY* e);
void updateBullets(BULLET* b);
void drawStart();
void drawGame();
void drawPlayer();
void drawEnemies(ENEMY* e);
void drawBullets(BULLET* b);
void drawLives();
void drawTankIcon();
void newBullet();
# 3 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 4 "game.c" 2
# 1 "sound.h" 1
# 74 "sound.h"

# 74 "sound.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;
# 5 "game.c" 2


PLAYER player;
BULLET bullets[10];
ENEMY enemies[5];


int score;
int time;
int damageTime;
int nullTime;
int lives;

int powerupX, powerupY, powerupOldX, powerupOldY, powerupWidth, powerupHeight, powerupXVelocity, powerupYVelocity;
int nullX, nullY, nullOldX, nullOldY, nullWidth, nullHeight, nullXVelocity, nullYVelocity;

unsigned short mainColor;
unsigned short accent;


void initGame() {
    score = 0;

    initPlayer();
    initEnemies();
    initBullets();
    lives = player.lives;

    powerupX = 120;
    powerupY = 120;
    powerupOldX = powerupX;
    powerupOldY = powerupY;
    powerupWidth = 3;
    powerupHeight = 3;
    powerupXVelocity = 4;
    powerupYVelocity = 4;

    nullX = 180;
    nullY = 109;
    nullOldX = nullX;
    nullOldY = nullY;
    nullWidth = 50;
    nullHeight = 50;
    nullXVelocity = -1;
    nullYVelocity = -1;

    mainColor = ((2&31) | (13&31) << 5 | (2&31) << 10);
    accent = ((1&31) | (25&31) << 5 | (2&31) << 10);
}


void initPlayer() {
    player.x = 117;
    player.y = 130;
    player.oldX = player.x;
    player.oldY = player.y;
    player.xVelocity = 0;
    player.yVelocity = 0;
    player.height = 11;
    player.width = 11;
    player.lives = 3;
    player.iframes = 0;
    player.direction = 0;
    player.fired = 0;
    player.powered = 0;
    player.speed = 1;
    player.color = ((5&31) | (5&31) << 5 | (5&31) << 10);
}


void initEnemies() {
    for (int i; i < 5; i++) {
        enemies[i].x = 10 + (i * 30);
        enemies[i].y = 30;
        enemies[i].oldX = enemies[i].x;
        enemies[i].oldY = enemies[i].y;
        enemies[i].width = 15;
        enemies[i].height = 10;
        enemies[i].active = 1;
        enemies[i].fired = 0;

        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                enemies[i].color = ((0&31) | (0&31) << 5 | (31&31) << 10);
                enemies[i].xVelocity = 1;
                enemies[i].yVelocity = 1;
                break;
            case 1:
                enemies[i].color = ((31&31) | (0&31) << 5 | (0&31) << 10);
                enemies[i].xVelocity = -1;
                enemies[i].yVelocity = -1;
                break;
            case 2:
                enemies[i].color = ((31&31) | (31&31) << 5 | (0&31) << 10);
                enemies[i].xVelocity = 1;
                enemies[i].yVelocity = -1;
                break;
            case 3:
                enemies[i].color = ((31&31) | (0&31) << 5 | (31&31) << 10);
                enemies[i].xVelocity = -2;
                enemies[i].yVelocity = 2;
        }
    }
}


void initBullets() {
    for (int i; i < 10; i++) {
        bullets[i].x = 10 + (i * 15);
        bullets[i].y = 100;
        bullets[i].oldX = bullets[i].x;
        bullets[i].oldY = bullets[i].y;
        bullets[i].width = 3;
        bullets[i].height = 3;
        bullets[i].active = 0;
        bullets[i].direction = 0;
        bullets[i].speed = 3;
        bullets[i].playerBullet = 0;
        bullets[i].color = ((5&31) | (5&31) << 5 | (5&31) << 10);
    }
}


void updateGame() {
    updatePlayer();
    for (int i = 0; i < 10; i++) {
        if (i < 5) {
            updateEnemies(&enemies[i]);
        }
        updateBullets(&bullets[i]);
    }


    powerupX += powerupXVelocity;
    powerupY += powerupYVelocity;

    if (powerupY < 18) {
        powerupY += 18 - powerupY;
        powerupYVelocity = -powerupYVelocity;
    }
    if (powerupY + powerupHeight - 1 > 159) {
        powerupY -= (powerupY + powerupHeight - 1) - 159;
        powerupYVelocity = -powerupYVelocity;
    }
    if (powerupX < 0) {
        powerupX = -powerupX;
        powerupXVelocity = -powerupXVelocity;
    }
    if (powerupX + powerupWidth - 1 > 239) {
        powerupX -= (powerupX + powerupWidth - 1) - 239;
        powerupXVelocity = -powerupXVelocity;
    }


    nullX += nullXVelocity;
    nullY += nullYVelocity;

    if (nullY < 18) {
        nullY += 18 - nullY;
        nullYVelocity = -nullYVelocity;
    }
    if (nullY + nullHeight - 1 > 159) {
        nullY -= (nullY + nullHeight - 1) - 159;
        nullYVelocity = -nullYVelocity;
    }
    if (nullX < 0) {
        nullX = -nullX;
        nullXVelocity = -nullXVelocity;
    }
    if (nullX + nullWidth - 1 > 239) {
        nullX -= (nullX + nullWidth - 1) - 239;
        nullXVelocity = -nullXVelocity;
    }


    if (nullTime >= 400) {
        nullTime = 0;
        nullX = rand() % 189;
        nullY = 18 + rand() % 101;
    }
    nullTime++;
}


void updatePlayer() {

    if (player.iframes) {
        if (damageTime >= 80) {
            damageTime = 0;
            player.iframes = 0;
        } else {
            damageTime++;
        }
    }


    if (collision(player.x, player.y, player.width, player.height, powerupX, powerupY, powerupWidth, powerupHeight) && player.powered == 0) {
        player.powered = 1;
        player.speed = 2;

        mainColor = ((21&31) | (17&31) << 5 | (1&31) << 10);
        accent = ((29&31) | (26&31) << 5 | (12&31) << 10);

        *(volatile u16*)0x04000068 = (((5) & 15) << 12) | (((6) & 7) << 8);
        *(volatile u16*)0x0400006C = NOTE_C7 | (1<<15);
    }


    if ((~(buttons) & ((1<<5))) && (player.x - player.speed > -1)) {
        player.x -= player.speed;
        player.direction = 6;
    }
    if ((~(buttons) & ((1<<4))) && (player.x + player.width < 240)) {
        player.x += player.speed;
        player.direction = 2;
    }
    if ((~(buttons) & ((1<<6))) && (player.y - player.speed > 17)) {
        player.y -= player.speed;
        player.direction = 0;


        if ((~(buttons) & ((1<<5))) && !(~(buttons) & ((1<<4)))) {
            player.direction = 7;
        } else if ((~(buttons) & ((1<<4))) && !(~(buttons) & ((1<<5)))) {
            player.direction = 1;
        }
    }
    if ((~(buttons) & ((1<<7))) && (player.y + player.height < 160)) {
        player.y += player.speed;
        player.direction = 4;


        if ((~(buttons) & ((1<<5))) && !(~(buttons) & ((1<<4)))) {
            player.direction = 5;
        } else if ((~(buttons) & ((1<<4))) && !(~(buttons) & ((1<<5)))) {
            player.direction = 3;
        }
    }


    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && player.fired == 0 && !collision(player.x, player.y, player.width, player.height, nullX, nullY, nullWidth, nullHeight)) {

        if (!player.powered) {
            player.fired = 1;
        }
        newBullet(0);


        *(volatile u16*)0x04000068 = (((5) & 15) << 12) | (((2) & 7) << 8);
        *(volatile u16*)0x0400006C = NOTE_D3 | (1<<15);
    }
}


void updateEnemies(ENEMY* e) {
    if (e->active) {

        if (collision(e->x, e->y, e->width, e->height, player.x, player.y, player.width, player.height)) {
            if (!player.iframes) {

                player.iframes = 1;
                player.lives -= 1;
                lives = player.lives;


                *(volatile u16*)0x04000068 = (((5) & 15) << 12) | (((6) & 7) << 8);
                *(volatile u16*)0x0400006C = NOTE_A2 | (1<<15);
            }
        }


        e->x += e->xVelocity;
        e->y += e->yVelocity;

        if (e->y < 18) {
            e->y += 18 - e->y;
            e->yVelocity = -e->yVelocity;
        }
        if (e->y + e->height - 1 > 159) {
            e->y -= (e->y + e->height - 1) - 159;
            e->yVelocity = -e->yVelocity;
        }
        if (e->x < 0) {
            e->x = -e->x;
            e->xVelocity = -e->xVelocity;
        }
        if (e->x + e->width - 1 > 239) {
            e->x -= (e->x + e->width - 1) - 239;
            e->xVelocity = -e->xVelocity;
        }
    }
}


void updateBullets(BULLET* b) {

    if (b->active) {
        for (int i = 0; i < 5; i++) {
            if (enemies[i].active) {

                if (collision(b->x, b->y, b->width, b->height, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height)) {
                    if (b->playerBullet) {
                        score++;
                        enemies[i].active = 0;
                        enemies[i].erased = 0;
                        player.fired = 0;


                        *(volatile u16*)0x04000078 = (((5) & 15) << 12) | (((6) & 7) << 8);
                        *(volatile u16*)0x0400007C = NOTE_C5 | (1<<15);
                    }
                    b->active = 0;
                    b->erased = 0;
                }
            }
        }

        switch (b->direction) {
            case 0:
                if (b->y - b->speed < 18) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->y -= b->speed;
                }
                break;
            case 1:
                if (b->x + b->width - 1 + b->speed - 1 > 239 || b->y - b->speed - 1 < 18) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->y -= b->speed - 1;
                    b->x += b->speed - 1;
                }
                break;
            case 2:
                if (b->x + b->width - 1 + b->speed > 239) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x += b->speed;
                }
                break;
            case 3:
                if (b->x + b->width - 1 + b->speed - 1 > 239 || b->y + b->height - 1 + b->speed - 1 > 159) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x += b->speed - 1;
                    b->y += b->speed - 1;
                }
                break;
            case 4:
                if (b->y +b->height - 1 + b->speed > 159) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->y += b->speed;
                }
                break;
            case 5:
                if (b->x - b->speed - 1 < 0 || b->y + b->height - 1 + b->speed - 1 > 159) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x -= b->speed - 1;
                    b->y += b->speed - 1;
                }
                break;
            case 6:
                if (b->x - b->speed < 0) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x -= b->speed;
                }
                break;
            case 7:
                if (b->x - b->speed - 1 < 0 || b->y - b->speed - 1 < 18) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x -= b->speed - 1;
                    b->y -= b->speed - 1;
                }
                break;
        }
    }
}


void newBullet(int firer) {
    for (int i = 0; i < 10; i++) {
        if (!bullets[i].active) {
            bullets[i].active = 1;
            bullets[i].erased = 0;
            bullets[i].direction = player.direction;
            if (!firer) {
                bullets[i].playerBullet = 1;
                switch (player.direction) {
                    case 0:
                        bullets[i].x = player.x + 4;
                        bullets[i].y = player.y - 3;
                        break;
                    case 1:
                        bullets[i].x = player.x + 10;
                        bullets[i].y = player.y - 2;
                        break;
                    case 2:
                        bullets[i].x = player.x + 11;
                        bullets[i].y = player.y + 4;
                        break;
                    case 3:
                        bullets[i].x = player.x + 10;
                        bullets[i].y = player.y + 10;
                        break;
                    case 4:
                        bullets[i].x = player.x + 4;
                        bullets[i].y = player.y + 11;
                        break;
                    case 5:
                        bullets[i].x = player.x - 2;
                        bullets[i].y = player.y + 10;
                        break;
                    case 6:
                        bullets[i].x = player.x - 3;
                        bullets[i].y = player.y + 4;
                        break;
                    case 7:
                        bullets[i].x = player.x - 2;
                        bullets[i].y = player.y - 2;
                        break;
                }
            }
            break;
        }
    }
}


void drawStart() {
    if (time >= 40 && time < 80) {
        drawRect(59, 90, 120, 8, ((15&31) | (15&31) << 5 | (15&31) << 10));
    } else if (time >= 80) {
        time = 0;
        drawString(59, 90, "Press Enter to Start", ((0&31) | (31&31) << 5 | (0&31) << 10));
    }
    time++;
}


void drawGame() {
    drawLives();
    for (int i = 0; i < 10; i++) {
        if (i < 5) {
            drawEnemies(&enemies[i]);
        }
        drawBullets(&bullets[i]);
    }


    drawRect(powerupOldX, powerupOldY, powerupWidth, powerupHeight, ((15&31) | (15&31) << 5 | (15&31) << 10));
    if (!player.powered) {
        drawRect(powerupX, powerupY, powerupWidth, powerupHeight, ((0&31) | (31&31) << 5 | (0&31) << 10));
    }


    drawPlayer();


    nullOldX = nullX;
    nullOldY = nullY;

    powerupOldX = powerupX;
    powerupOldY = powerupY;
}

void drawPlayer() {
    drawRect(player.oldX, player.oldY, player.width, player.height, ((15&31) | (15&31) << 5 | (15&31) << 10));


    drawRect(nullOldX, nullOldY, nullWidth, nullHeight, ((15&31) | (15&31) << 5 | (15&31) << 10));
    drawRect(nullX, nullY, nullWidth, nullHeight, ((9&31) | (9&31) << 5 | (9&31) << 10));



    if (player.iframes && (damageTime % 10) >= 5) {

    } else {
        drawRect(player.x, player.y, player.width, player.height, player.color);
        drawRect(player.x + 1, player.y + 1, 9, 9, mainColor);
        drawRect(player.x + 3, player.y + 3, 5, 5, accent);
        switch (player.direction) {
            case 0:
                drawRect(player.x + 5, player.y, 1, 3, accent);
                break;
            case 1:
                (videoBuffer[((player.y + 1) * (240) + (player.x + 9))] = accent);
                (videoBuffer[((player.y + 2) * (240) + (player.x + 8))] = accent);
                break;
            case 2:
                drawRect(player.x + 8, player.y + 5, 3, 1, accent);
                break;
            case 3:
                (videoBuffer[((player.y + 8) * (240) + (player.x + 8))] = accent);
                (videoBuffer[((player.y + 9) * (240) + (player.x + 9))] = accent);
                break;
            case 4:
                drawRect(player.x + 5, player.y + 8, 1, 3, accent);
                break;
            case 5:
                (videoBuffer[((player.y + 8) * (240) + (player.x + 2))] = accent);
                (videoBuffer[((player.y + 9) * (240) + (player.x + 1))] = accent);
                break;
            case 6:
                drawRect(player.x, player.y + 5, 3, 1, accent);
                break;
            case 7:
                (videoBuffer[((player.y + 2) * (240) + (player.x + 2))] = accent);
                (videoBuffer[((player.y + 1) * (240) + (player.x + 1))] = accent);
                break;
        }
    }

    player.oldX = player.x;
    player.oldY = player.y;
}


void drawEnemies(ENEMY* e) {
    if (e->active) {
        drawRect(e->oldX, e->oldY, e->width, e->height, ((15&31) | (15&31) << 5 | (15&31) << 10));
        (videoBuffer[((e->y) * (240) + (e->x + 2))] = e->color);
        (videoBuffer[((e->y) * (240) + (e->x + 12))] = e->color);
        drawRect(e->x + 3, e->y + 1, 9, 4, e->color);
        (videoBuffer[((e->y + 2) * (240) + (e->x + 2))] = e->color);
        (videoBuffer[((e->y + 2) * (240) + (e->x + 12))] = e->color);
        drawRect(e->x + 1, e->y + 3, 2, 1, e->color);
        drawRect(e->x + 12, e->y + 3, 2, 1, e->color);
        drawRect(e->x, e->y + 4, 3, 1, e->color);
        drawRect(e->x + 12, e->y + 4, 3, 1, e->color);
        drawRect(e->x, e->y + 5, 6, 1, e->color);
        drawRect(e->x + 9, e->y + 5, 6, 1, e->color);
        drawRect(e->x + 1, e->y + 6, 4, 1, e->color);
        drawRect(e->x + 10, e->y + 6, 4, 1, e->color);
        drawRect(e->x + 2, e->y + 7, 2, 1, e->color);
        drawRect(e->x + 11, e->y + 7, 2, 1, e->color);
        drawRect(e->x + 3, e->y + 8, 2, 1, e->color);
        drawRect(e->x + 10, e->y + 8, 2, 1, e->color);
        drawRect(e->x + 4, e->y + 9, 2, 1, e->color);
        drawRect(e->x + 9, e->y + 9, 2, 1, e->color);
        drawRect(e->x + 6, e->y + 2, 3, 3, ((31&31) | (19&31) << 5 | (7&31) << 10));
        (videoBuffer[((e->y + 2) * (240) + (e->x + 5))] = ((31&31) | (19&31) << 5 | (7&31) << 10));
        (videoBuffer[((e->y + 2) * (240) + (e->x + 9))] = ((31&31) | (19&31) << 5 | (7&31) << 10));
        (videoBuffer[((e->y + 5) * (240) + (e->x + 7))] = ((31&31) | (19&31) << 5 | (7&31) << 10));
        drawRect(e->x + 6, e->y + 7, 3, 1, ((0&31) | (31&31) << 5 | (31&31) << 10));
        (videoBuffer[((e->y + 6) * (240) + (e->x + 7))] = ((0&31) | (31&31) << 5 | (31&31) << 10));
        (videoBuffer[((e->y + 8) * (240) + (e->x + 7))] = ((0&31) | (31&31) << 5 | (31&31) << 10));
        e->oldX = e->x;
        e->oldY = e->y;

    } else if (!e->erased) {
        drawRect(e->oldX, e->oldY, e->width, e->height, ((15&31) | (15&31) << 5 | (15&31) << 10));
        drawRect(e->x, e->y, e->width, e->height, ((15&31) | (15&31) << 5 | (15&31) << 10));
        e->erased = 1;
    }
}


void drawBullets(BULLET* b) {
    if (b->active) {
        drawRect(b->oldX, b->oldY, b->width, b->height, ((15&31) | (15&31) << 5 | (15&31) << 10));
        drawRect(b->x, b->y, b->width, b->height, b->color);
        b->oldX = b->x;
        b->oldY = b->y;
    } else if (!b->erased) {
        drawRect(b->oldX, b->oldY, b->width, b->height, ((15&31) | (15&31) << 5 | (15&31) << 10));
        drawRect(b->x, b->y, b->width, b->height, ((15&31) | (15&31) << 5 | (15&31) << 10));
        b->erased = 1;
    }
}


void drawLives() {
    drawRect(5, 5, 59, 8, ((0&31) | (0&31) << 5 | (0&31) << 10));
    for (int i = 0; i < lives; i++) {
        drawTankIcon(5 + (i * 18), 5);
    }
}


void drawTankIcon(int x, int y) {
    drawRect(x + 3, y, 6, 3, ((2&31) | (13&31) << 5 | (2&31) << 10));
    drawRect(x + 9, y + 1, 4, 1, ((2&31) | (13&31) << 5 | (2&31) << 10));
    drawRect(x + 1, y + 3, 11, 1, ((2&31) | (13&31) << 5 | (2&31) << 10));
    (videoBuffer[((y + 4) * (240) + (x))] = ((2&31) | (13&31) << 5 | (2&31) << 10));
    (videoBuffer[((y + 4) * (240) + (x + 12))] = ((2&31) | (13&31) << 5 | (2&31) << 10));
    drawRect(x + 1, y + 4, 11, 1, ((5&31) | (5&31) << 5 | (5&31) << 10));
    drawRect(x, y + 5, 13, 2, ((5&31) | (5&31) << 5 | (5&31) << 10));
    drawRect(x + 1, y + 7, 11, 1, ((5&31) | (5&31) << 5 | (5&31) << 10));
    (videoBuffer[((y + 5) * (240) + (x + 1))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 5) * (240) + (x + 3))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 5) * (240) + (x + 5))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 5) * (240) + (x + 7))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 5) * (240) + (x + 9))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 5) * (240) + (x + 11))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 6) * (240) + (x + 2))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 6) * (240) + (x + 4))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 6) * (240) + (x + 6))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 6) * (240) + (x + 8))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
    (videoBuffer[((y + 6) * (240) + (x + 10))] = ((9&31) | (9&31) << 5 | (9&31) << 10));
}
