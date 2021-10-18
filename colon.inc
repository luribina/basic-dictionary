%define last 0

%macro colon 2
    %ifstr %1
        %ifid %2
            %2: dq last
            db %1, 0
        %else
            %error "Second argument must be an identifier"
        %endif
    %else
        %error "First argument must be a string"
    %endif
%define  last  %2
%endmacro
