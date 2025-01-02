# nvim-plugin-prompt-register
因为我总是忘记自己设置的快捷键，所以写了这个插件。  
简单来说，就是通过输入提示的一部分，来找到对应的快捷键。  
I always forget my own shortcuts, so I wrote this plugin.  
Basically, it finds the corresponding shortcut by inputting part of the prompt.  

## zh-CN
register 是一个柯里化函数，接收字符串参数 prompt(提示)，并返回用于注册快捷键的函数。  
```lua
register('快速保存')('n', 'wq', ':wq<CR>', { noremap = true, silent = true })
```

register 支持模糊搜索，输入提示的一部分即可找到对应的快捷键。  
```bash
:Prompt 快速
```
这将会查询字符串中包含 `快速` 的快捷键并返回第一个。  
打印类似于：
```lua
{ n, wq, :wq<CR>, { true, true } }
```


## en-US
register is a curried function that receives a string parameter prompt (prompt) and returns a function for registering shortcuts.  
```lua
register('Quick Save')('n', 'wq', ':wq<CR>', { noremap = true, silent = true })
```

register supports fuzzy search, input part of the prompt to find the corresponding shortcut.  
```bash
:Prompt Quick
```
This will query the shortcut containing `quick` in the string and return the first one.  
Prints something like:
```lua
{ n, wq, :wq<CR>, { true, true } }
```
