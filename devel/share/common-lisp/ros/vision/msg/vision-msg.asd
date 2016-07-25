
(cl:in-package :asdf)

(defsystem "vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BlobDetection" :depends-on ("_package_BlobDetection"))
    (:file "_package_BlobDetection" :depends-on ("_package"))
  ))