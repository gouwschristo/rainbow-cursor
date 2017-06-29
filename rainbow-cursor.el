;;; rainbow-cursor.el --- add some color to your life with a colorful cursor.            -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Christo Gouws

;; Author: Christo Gouws <gouws.christo@gmail.com>
;; Keywords: lisp,rainbow,cursor,color
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package changes the color of the cursor with every keystroke
;; in order to add some color to your life, think color-theraphy.
;;
;; To enable, add the following to your config:
;;
;; (require 'rainbow-cursor)
;; (add-hook 'post-self-insert-hook 'rainbow-cursor)
;;
;;; Code:

;; Peaceful
(setq rainbow-cursor-colors '("tan1" "deep sky blue" "lawn green" "yellow" "orange" "purple" "pink"))

;; Valentine
; (setq rainbow-cursor-colors '("brown" "firebrick" "light coral" "salmon" "tomato" "red" "pink"))

;; Prey mantis
;; (setq rainbow-cursor-colors '("chartreuse" "lawn green" "green" "spring green" "medium spring green"))

;; Black and Gold
;; (setq rainbow-cursor-colors '("black" "gold"))

;; Chocolate
;; (setq rainbow-cursor-colors '("sienna" "saddle brown" "chocolate" "peru"))

;; Ocean
;; (setq rainbow-cursor-colors '("light sea green" "medium aquamarine" "dark cyan" "dark turquoise" "sky blue"))


(setq rainbow-cursor-direction "random")
(setq counter 0)

(defun rainbow-cursor ()

  (if (string= rainbow-cursor-direction "right")
  (setq counter (+ counter 1)))

  (if (string= rainbow-cursor-direction "left")
  (setq counter (- counter 1)))

  (if (string= rainbow-cursor-direction "random")
      (catch 'random-color 
	(set-cursor-color (nth (random (safe-length rainbow-cursor-colors)) rainbow-cursor-colors))
	(throw 'random-color "1")))


  (if (>= counter (safe-length rainbow-cursor-colors))
      (setq counter 0))
  (if (< counter 0)
      (setq counter (- (safe-length rainbow-cursor-colors) 1)))


  (set-cursor-color (nth counter rainbow-cursor-colors)))


;; Random mode
;;    (set-cursor-color (nth (random (safe-length rainbow-cursor-colors)) rainbow-cursor-colors)))

;; rainbow cursor themes
;; order: right, left, random

(provide 'rainbow-cursor)


;;; rainbow-cursor.el ends here

