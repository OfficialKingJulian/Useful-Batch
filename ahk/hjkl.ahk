; Remap Alt+h,j,k,l to arrow keys

!h::Send {Left}
!j::Send {Down}
!k::Send {Up}
!l::Send {Right}

+!h::Send +{Left}
+!j::Send +{Down}
+!k::Send +{Up}
+!l::Send +{Right}

#!h::Send #{Left}
#!j::Send #{Down}
#!k::Send #{Up}
#!l::Send #{Right}

; Alt+/ to search
  !/::
  Send, ^f
  return
