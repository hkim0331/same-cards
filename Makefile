all: build

build:
	raco exe --gui same-cards.rkt

clean:
	${RM} *~
	${RM} -r same-cards.app
