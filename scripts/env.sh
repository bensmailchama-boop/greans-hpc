# Source if you built local libs under $HOME/devel
setenv DEVEL "$HOME/devel"
setenv WX_HOME "$DEVEL/wx"
setenv BOOST_ROOT "$DEVEL/boost"
setenv BULLET_ROOT "$DEVEL/bullet"
setenv GRAPHVIZ_ROOT "$DEVEL/graphviz"

setenv PATH "$WX_HOME/bin:$PATH"
setenv PKG_CONFIG_PATH "$WX_HOME/lib/pkgconfig:$GRAPHVIZ_ROOT/lib/pkgconfig:$PKG_CONFIG_PATH"
setenv CPATH "$BOOST_ROOT/include:$BULLET_ROOT/include:$GRAPHVIZ_ROOT/include:$CPATH"
setenv LIBRARY_PATH "$BULLET_ROOT/lib:$GRAPHVIZ_ROOT/lib:$LIBRARY_PATH"
setenv LD_LIBRARY_PATH "$WX_HOME/lib:$BULLET_ROOT/lib:$GRAPHVIZ_ROOT/lib:$LD_LIBRARY_PATH"
