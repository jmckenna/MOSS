      SUBROUTINE neigh(iparam,rmax,nk,nt,maxk)
C***  THIS SUBROUTINE INPUTS THE SEARCH RADIUS AND MAXIMUM NUMBER
C***  OF HOLES TO BE USED IN KRIGING A BLOCK OR A POINT.
C***  FIRST STATEMENT IS DUMMY, RESERVED FOR FUTURE VERSIONS OF  KRIG-MOSS LINK
C***
C      READ(IPARAM) NK
 100  CONTINUE
      WRITE (*,99001)
99001 FORMAT (' ENTER THE MAXIMUM DISTANCE (IN METERS) FROM CENTROID',/,
     &        ' FOR A HOLE TO BE INCLUDED FOR KRIGING:',/,' ?'\)
      READ (*,99002,ERR=300) rmax
99002 FORMAT (BN,F10.0)
      IF ( rmax.LE.0.0 ) THEN
         WRITE (*,*) char(bel)
         WRITE (*,99003)
99003    FORMAT (' MAXIMUM DISTANCE MUST BE GREATER THAN ZERO; REENTER')
         GOTO 100
      ENDIF
 200  CONTINUE
      WRITE (*,99004)
99004 FORMAT (' ENTER THE MAXIMUM NUMBER OF HOLES TO BE',
     &        ' USED WITHIN THE NEIGHBORHOOD (MAX=50):',/,' ?'\)
      READ (*,99006,ERR=400) nk
      IF ( nk.LE.nt ) THEN
         need = nt + 1
         WRITE (*,*) char(bel)
         WRITE (*,99005) need
99005    FORMAT (' YOU MUST SPECIFY AT LEAST ',I2,' HOLES')
         GOTO 200
      ELSE
         IF ( nk.GT.maxk ) nk = maxk
         RETURN
      ENDIF
99006 FORMAT (BN,I3)
 300  CONTINUE
      WRITE (*,*) char(bel)
      WRITE (*,99007)
99007 FORMAT (' REAL VALUE EXPECTED; REENTER VALUE')
      GOTO 100
 400  CONTINUE
      WRITE (*,*) char(bel)
      WRITE (*,99008)
99008 FORMAT (' INTEGER VALUE EXPECTED; REENTER VALUE')
      GOTO 200
      END
