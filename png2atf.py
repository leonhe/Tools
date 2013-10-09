import os,io;
'''
批处理目录下PNG图片转换为ATF，并把对应的XML文件中PNG后缀转换成ATF

'''
current_dir = os.getcwd()#获取当前目录
dir_list=os.listdir(current_dir)#当前目录下所有文件
for line in dir_list:
   file_splitext = os.path.splitext(line)
   if file_splitext[1]=='.png':#执行转换目录下PNG图片为压缩ATF格式文件
        atffileName = file_splitext[0]
        command_line = "png2atf.exe -n 0,0 -i %s -o %s"%(line,atffileName+'.atf')
        #print(command_line)
        os.system(command_line)
   elif file_splitext[1]=='.xml':#替换XML中标有PNG后缀为ATF
        fXml = open(line,'r')
        fLine=fXml.readlines()
        news_context=r""
        for xml in fLine:
            news_context+=xml.replace(".png",'.atf')
            #fXml.flush()
            #print(xml.replace(".png",'.atf'))
            #fXml.write(re.sub(r'.png','.atf',f.))
        fXml.close()
        fXml = open(line,'w')
        fXml.write(news_context)
        fXml.close()
        #print(news_context)
        
        
