(in-package :cl-crypto)

(defclass key ()
  ((pointer :reader pointer :initarg :pointer)
   (location :reader location :initarg :location)))

(defclass rsa-key (key) ())

(defgeneric load-rsa-key (place))
(defgeneric sign-length (key))
(defgeneric key-size (key))

(defmethod load-rsa-key ((text string))
  (cffi:with-foreign-string (rsa-key-string text)
    (let ((bo (bio-new (bio-s-mem)))
          (rsa (cffi:foreign-alloc :pointer)))
      (cffi:with-foreign-object (rsa-ptr :pointer)
        (setf (cffi:mem-aref rsa-ptr :pointer) rsa)
        (bio-write bo rsa-key-string (length text))
        (make-instance 'rsa-key
                       :pointer (pem-read-bio-rsa-privkey bo (cffi:null-pointer) (cffi:null-pointer) (cffi:null-pointer))
                       :location "string")))))


(defmethod sign-length ((rsa-key rsa-key))
  256)

(defmethod sign ((key key) digest-algo (text string))
  (cl-base64:usb8-array-to-base64-string
   (cffi:with-foreign-array (output (make-array 256 :initial-element 0) `(:array :uchar ,(sign-length key)))
     (cffi:with-foreign-object (output-len :int)
       (let* ((digest-content (digest-compute digest-algo text))
              (digest-length (length digest-content)))
         (cffi:with-foreign-array (digest digest-content `(:array :uchar ,digest-length))
           (rsa-sign (digest-nid digest-algo) digest digest-length output output-len (pointer key))
           (cffi:foreign-array-to-lisp output `(:array :uchar ,(sign-length key)))))))))


(defmethod key-size ((key rsa-key))
  (rsa-size (pointer key)))

(defmethod encrypt ((key rsa-key) message)
  (cffi:with-foreign-string ((input input-size) message)
    (let ((output (cffi:foreign-alloc :uchar :count (key-size key))))
      (unwind-protect
           (let ((result (rsa-encrypt input-size input output (pointer key) +RSA_PKCS1_OAEP_PADDING+)))
             (if (= -1 result)
                 "failed"
                 (cffi:foreign-array-to-lisp output `(:array :uchar ,result))))
        (cffi:foreign-free output)))))
      
    
