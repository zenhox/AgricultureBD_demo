<html>
<body>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script>
    window.onload = function(){
        document.getElementById("get").onclick = function(){
            $.ajax({url:"/Agriculture/hello",success:function(result){
                 console.log(result);
                 $("#div1").html(result);
            }});
        }
    }
</script>
<h2>Hello World!</h2>
<button id="get">get</button>
<div id="div1"></div>
</body>
</html>
