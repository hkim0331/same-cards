#!/usr/bin/env racket
#lang racket/gui

(require "misc.rkt")

(define *clicks* 0)
(define *values* '())
(define *buttons* '())

(define check
  (lambda (kind)
    (when (even? *clicks*)
      (if (= (car *values*) (cadr *values*))
                   (begin
                     (send (car *buttons*) enable #f)
                     (send (cadr *buttons*) enable #f)
                     "same")
                   (begin
                    (sleep 1)
                    (send (car *buttons*) set-label " ")
                    (send (cadr *buttons*) set-label " ")
                    "bad")))))

(define *frame* (new frame% [label "same game"]))

(define my-button%
  (class button%
    [init-field kind]
    (super-new [callback (lambda (b e)
                           (set! *clicks* (+ 1 *clicks*))
                           (set! *values* (cons kind *values*))
                           (set! *buttons* (cons b *buttons*))
                           (send *total-clicks* set-label (number->string *clicks*))
                           (send b set-label (number->string kind))
                           (check kind))])))

(define make-button
  (lambda (k p)
    (new my-button%
     [parent p]
     [label " "]
     [kind k])))

(define hp (new horizontal-pane% [parent *frame*]))

;; (make-button 1 hp)
;; (make-button 2 hp)
;; (make-button 1 hp)

;;(define *cards* (sort (cons 0 (cons 0 (repli 4 (range 1 14)))) <))
(define *cards* (shuffle (cons 0 (cons 0 (repli 4 (range 1 14))))))

(define make-buttons
  (lambda (cs)
    (let ((pane (new horizontal-pane% [parent *frame*])))
      (map (lambda (c) (make-button c pane)) cs))))

(define make-deck
  (lambda (cols cards)
    (map (lambda (parts) (make-buttons parts))
         (partition cols cards))
    (let ((bottom (new horizontal-pane% [parent *frame*])))
      (new message% [parent bottom]
           [label "clicks:"]))
    #t))

(make-deck 9 *cards*)

;(define bottom (new horizontal-pane% [parent *frame*]))

;(new message% [parent bottom]
;     [label "clicks:"])

(define *total-clicks* (new message% [parent bottom]
                      [label "    "]))

(send *frame* show #t)
