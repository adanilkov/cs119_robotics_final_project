;; Auto-generated. Do not edit!


(when (boundp 'brl_pxh_api::JointRadFeedback)
  (if (not (find-package "BRL_PXH_API"))
    (make-package "BRL_PXH_API"))
  (shadow 'JointRadFeedback (find-package "BRL_PXH_API")))
(unless (find-package "BRL_PXH_API::JOINTRADFEEDBACK")
  (make-package "BRL_PXH_API::JOINTRADFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude JointRadFeedback.msg.html


(defclass brl_pxh_api::JointRadFeedback
  :super ros::object
  :slots (_log ))

(defmethod brl_pxh_api::JointRadFeedback
  (:init
   (&key
    ((:log __log) "")
    )
   (send-super :init)
   (setq _log (string __log))
   self)
  (:log
   (&optional __log)
   (if __log (setq _log __log)) _log)
  (:serialization-length
   ()
   (+
    ;; string _log
    4 (length _log)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _log
       (write-long (length _log) s) (princ _log s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _log
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _log (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get brl_pxh_api::JointRadFeedback :md5sum-) "c3e2a6f3c8b4a69b39bb08b44fadcdca")
(setf (get brl_pxh_api::JointRadFeedback :datatype-) "brl_pxh_api/JointRadFeedback")
(setf (get brl_pxh_api::JointRadFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Feedback
string log


")



(provide :brl_pxh_api/JointRadFeedback "c3e2a6f3c8b4a69b39bb08b44fadcdca")


