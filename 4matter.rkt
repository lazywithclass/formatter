#lang racket

(require racket/trace)
(provide format)

;; TODO make it work for both formatted
;; text and non formatted text, as right now
;; it always ignores spaces (it should ignore
;; spaces only for non formatted texts)
(define (read-chars newline-seen)
  (let ([c (read-char)])
    (cond
      ((and (equal? c #\newline) newline-seen) '())
      ((equal? c #\newline) (cons c (read-chars #t)))
      ((equal? c " ") (read-chars newline-seen))
      (else (cons c (read-chars #f))))))

(define (format a b newline-seen)
  (cond
    ((equal? a '()) '())
    ((equal? b '()) '())
    ((equal? (car a) '()) b)
    ((equal? (car a) #\space)
     (cons #\space (format (rest a) b newline-seen)))
    ((equal? (car a) #\newline)
     (cons #\newline (format (rest a) b #t)))
    (else (cons (car b) (format (rest a) (rest b) newline-seen)))))

;; (trace format)

;; (format '(#\2 #\newline) '(#\newline) #f)

;; (let ([a (read-chars #f)]
;;       [b (read-chars #f)])
;;   (format a b #f))
