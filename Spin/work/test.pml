#define down(s) atomic{s ; s--}
#define up(s) atomic{s++}

bool p_in_cs = false ;
bool q_in_cs = false ;

byte mutex = 1 ;

active proctype P() {
    do
    ::
        down(mutex) ;
        p_in_cs = true ;
        printf("P is in its critical section\n") ;
        p_in_cs = false ;
        up(mutex) ;
    od
}

active proctype Q() {
    do
    ::
        down(mutex) ;
        q_in_cs = true ;
        printf("Q is in its critical section\n") ;
        q_in_cs = false ;
        up(mutex) ;
    od
}

ltl Safe {
    [] (p_in_cs -> ! q_in_cs)
}
