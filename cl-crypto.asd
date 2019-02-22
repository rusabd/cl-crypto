(asdf:defsystem #:cl-crypto
  :license "MIT"
  :author "Ruslan Abdulkhalikov"
  :depends-on ("cl+ssl"
	       "cl-base64")
  :components ((:file "package")
               (:file "ffi")
               (:file "digest")
               (:file "rsa")))
