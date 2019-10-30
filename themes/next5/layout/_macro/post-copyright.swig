<script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<ul class="post-copyright">
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.author') + __('symbol.colon') }}</strong>
    {{ post.author | default(theme.author) }}
  </li>
  <li class="post-copyright-author">
    <strong>本文标题: <a href="{{ url_for(page.path) }}">{{ page.title }}</a></strong>
  </li>
  <li class="post-copyright-author">
   
    <strong>发布时间: {{ page.date.format("YYYY年MM月DD日 - HH:MM") }}</strong>
  </li>
    <li class="post-copyright-author">
   
    <strong>最后更新: {{ page.updated.format("YYYY年MM月DD日 - HH:MM") }}</strong>
  </li>
  </li>
  <li class="post-copyright-link">
    <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
    <a href="{{ post.url | default(post.permalink) }}" title="{{ post.title }}">{{ post.url | default(post.permalink) }}</a>
	<span class="copy-path"  title="点击复制文章链接"><i class="fa fa-clipboard" data-clipboard-text="{{ page.permalink }}"  aria-label="复制成功！"></i></span>
  </li>
  <li class="post-copyright-license">
    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>
    {{ __('post.copyright.license_content', theme.post_copyright.license_url, theme.post_copyright.license) }}
  </li>
  <li class="post-copyright-license">
    并保留本声明和上方二维码。感谢您的阅读和支持！
  </li>
</ul>
<script> 
    var clipboard = new Clipboard('.fa-clipboard');
    $(".fa-clipboard").click(function(){
      clipboard.on('success', function(){
        swal({   
          title: "",   
          text: '复制成功',
          icon: "success", 
          showConfirmButton: true
          });
    });
    });  
</script>

