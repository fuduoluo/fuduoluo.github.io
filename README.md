
## 目录结构
------
```
├── node_modules：是依赖包
├── public  #存放被解析markdown、html文件
├── scaffolds #当您新建文章时，根据 scaffold生成文件
├── source  #资源文件夹
|   └── _posts #博客文章目录
└── themes #主题
├── _config.yml   #网站的配置信息。标题、网站名称等
├── db.json：#source解析所得到的
├── package.json  # 应用程序的配置信息
```
##### node_modules：项目依赖包
##### public：文件夹，默认没有，存放生成的静态文件。用来上传到Github或主机空间。
##### scaffolds：
模板文件夹，不过这里的“模板”概念没有那么高端。这个“模板”就是指新建的markdown文件的模板，每新建一个markdown文件（由于Hexo使用markdown语法，在渲染生成静态HTML页面之前，源文件都是markdown文件），就会包含对应模板的内容。该文件夹内有三个模板：
draft.md，草稿的模板page.md，页面的模板post.md，文章的模板模版当您新建文章时，Hexo 会根据 scaffold 来建立文件。scripts脚本 文件夹。脚本是扩展 Hexo 最简易的方式，在此文件夹内的 JavaScript 文件会被自动执行。source资源文件夹是存放用户资源的地方，此处存有渲染生成静态页面需要的所有源文件，包括markdown文件、图片文件；默认此文件夹下只有一个_post文件夹，存放文章的markdown源文件；每个页面有一个以该页面命名的文件夹，也存放在source文件夹下。除 _posts 文件夹之外，开头命名为 _ (下划线)的文件 / 文件夹和隐藏的文件将会被忽略。Markdown 和 HTML 文件会被解析并放到 public 文件夹，而其他文件会被拷贝过去。themes主题文件夹。Hexo 会根据主题来生成静态页面。
##### source：资源文件夹
##### themes：项目主题包
##### _config.yml：站点配置文件是YAML格式文件，也是Hexo的站点配置文件，网站的 配置 信息，您可以在此配置大部分的参数。
##### db.json：source解析所得到的
##### package.json：配置hexo运行需要的node.js包，不用手动更改（PS：通常不需要干预它，不过其中有一条"name": "hexo-site"起着告诉hexo该文件夹是hexo站点的作用，因此更加不要修改该文件内容，安装hexo其他模块也依赖该文件）
应用程序的信息。EJS, Stylus 和 Markdown renderer 已默认安装，您可以自由移除。
```
package.json
{ 
"name": "hexo-site",
"version": "", 
"private": true,
"hexo": { "version": "" },
"dependencies": { "hexo-renderer-ejs": "*", "hexo-renderer-stylus": "*", "hexo-renderer-marked": "*" }
}
```

