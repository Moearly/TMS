gulp = require('gulp')
del = require('del')
uglify = require('uglify')
miniCss = require('gulp-minify-css')
uncss = require('gulp-uncss')
runSequence = require('run-sequence')
browserSync = require('browser-sync').create()

gulp.task('default', (callback)->
  runSequence(['clean'],['build'],['serve','watch'], callback)
)

gulp.task('clean', (callback)->
  del(['./dist/'], callback)
)

gulp.task('build', (callback) ->
  runSequence(['copy', 'miniJs', 'miniCss'], callback)
)

gulp.task('copy',->
  gulp.src('./src/**/*.*').pipe(gulp.dest('./dist/'))
)

gulp.task('miniJs',->
  gulp.src('./src/**/*.js').pipe(uglify()).pipe(gulp.dest('./dist/'))
)

gulp.task('miniCss', ->
  gulp.src('./src/**/*.css')
  .pipe(minifyCss())
#  .pipe(unCss())
  .pipe(gulp.dest('./dist/'))
)

#合并
gulp.task('concat', ->
  gulp.src('./src/*.js')
  .pipe(concat('all.js', {newLine: ';\n'}))
  .pipe(gulp.dest('./dist/'))
)
#打开浏览器
gulp.task('serve', ->
  browserSync.init({
    server: {
      baseDir: './dist/'
    }
    port: 7411
  })
)
#监视文件的变化
gulp.task('watch', ->
  gulp.watch('./src/**/*.*', ['reload'])
)

#从新加载
gulp.task('reload', (callback)->
  runSequence(['build'], ['reload-browser'], callback)
)
#从新加载浏览器
gulp.task('reload-browser', ->
  browserSync.reload()
)



gulp.task()