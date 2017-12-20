#lang racket

(require "index.rkt")

(let ([a (read-chars #f)]
      [b (clean-whitespace (read-chars #f))])
  (print-as-string (format a b #f)))
