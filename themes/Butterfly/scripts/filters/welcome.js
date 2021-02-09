const logger = require('hexo-log')()

hexo.on('ready', () => {
  const { version } = require('../../package.json')
  logger.info(`
  ===================================================================
                   欢迎LaputCat,Hexo当前版本：${version}                        
  ===================================================================`)
})
