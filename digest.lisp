(in-package :cl-crypto)

(defclass digest () ())

(defgeneric digest-compute (digest text))
(defgeneric digest-nid (digest))

(defmethod digest-compute ((digest (eql :sha1)) (text string))
  (cffi:with-foreign-array (output (make-array 20 :initial-element 0) '(:array :uchar 20))
    (cffi:with-foreign-string (input text)
      (sha1 input (length text) output)
      (cffi:foreign-array-to-lisp output '(:array :uchar 20)))))


(defmethod digest-compute ((digest (eql :sha256)) (text string))
  (cffi:with-foreign-array (output (make-array 32 :initial-element 0) '(:array :uchar 32))
    (cffi:with-foreign-string (input text)
      (sha256 input (length text) output)
      (cffi:foreign-array-to-lisp output '(:array :uchar 32)))))


(defmethod digest-nid ((digest (eql :sha1)))
  64)
(defmethod digest-nid ((digest (eql :sha256)))
  672)
