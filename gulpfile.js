'use strict'

let gulp = require('gulp')
let exec = require('child_process').exec

gulp.task('build', function (cb) {
  exec('swift build | xcpretty', function (err, stdout, stderr) {
    console.log(stdout)
    console.log(stderr)
    cb(err)
  })
})

gulp.task('test', function (cb) {
  exec('swift test 2>&1 | xcpretty', function (err, stdout, stderr) {
    console.log(stdout)
    console.log(stderr)
    cb(err)
  })
})

gulp.task('default', ['watch'])

gulp.task('watch', () => {
  gulp.watch('./Sources/**/*.swift', ['test'])
  gulp.watch('./Tests/**/*.swift', ['test'])
})
