#!/usr/bin/env racket
#lang racket

(provide
 partition
 repli
 )

(define repli
  (lambda (n xs)
    (if (zero? n)
        '()
        (append xs (repli (- n 1) xs)))))

(define take-aux
  (lambda (n xs ret)
    (if (zero? n)
        (reverse ret)
        (take-aux (- n 1) (cdr xs) (cons (car xs) ret)))))

(define take
  (lambda (n xs)
    (take-aux n xs '())))

(define drop
  (lambda (n xs)
    (if (zero? n)
        xs
        (drop (- n 1) (cdr xs)))))

(define partition-aux
  (lambda (n xs ret)
    (cond
      ((null? xs) (reverse ret))
      ;; FIXME, 敗北。length 取らずにできんかね？
      ((< (length xs) n) (reverse (cons xs ret)))
      (else
       (let* ((l (take n xs))
              (r (drop n xs)))
         (partition-aux n r (cons l ret)))))))

(define partition
  (lambda (n xs)
    (partition-aux n xs '())))
