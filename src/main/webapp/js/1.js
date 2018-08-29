var time=3000;

function show(whichpic)
{
    t2=window.clearInterval(t2);
    var s1=whichpic.getAttribute("href");
    var s2=document.getElementById("pic");
    s2.setAttribute("src",s1);
    var s3=whichpic.getAttribute("id");

    i=s3[3]-1;
    if(i==0)
    {
        i=4;
    }else if(i==-1)
    {
        i=3;
    }
    show2();
    t2 = window.setInterval("show2()",time);
}

var t2 = window.setInterval("show2()",time);
var i=0;
function show2()
{
    if(i==4)
    {
        i=0;
    }
    i++;
    var s1=document.getElementById("PNG"+i);
    var s2=document.getElementById("pic");
    s2.setAttribute("src",s1);

    var j=i-1;
    if(j==0)
    {
        j=4;
    }
    s1=document.getElementById("PNG"+j);
    s2=document.getElementById("pic1");
    s2.setAttribute("src",s1);

    j=i+1;
    if(j==5)
    {
        j=1;
    }
    s1=document.getElementById("PNG"+j);
    s2=document.getElementById("pic2");
    s2.setAttribute("src",s1);
}

function show3()
{
    t2=window.clearInterval(t2);
    if(i>=2)
    {
        i=i-2;
    }else if(i==1)
    {
        i=3;
    }else
    {
        i=2;
    }
    show2();
    t2 = window.setInterval("show2()",time);
}
function show4()
{
    t2=window.clearInterval(t2);
    show2();
    t2 = window.setInterval("show2()",time);
}

var x,y;
function get()
{
    e=arguments[0]||window.event;
    x=e.clientX;
    y=e.clientY;
}
function change()
{
    e=arguments[0]||window.event;
    x=e.clientX-x;
    y=e.clientY-y;
    if(x<0)
    {
        show3();
    } else
    {
        show4();
    }
}