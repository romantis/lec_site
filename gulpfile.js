const gulp = require('gulp');
const gulpLoadPlugins = require('gulp-load-plugins');
const del = require('del');
const runSequence = require('run-sequence');

const $ = gulpLoadPlugins();

let dev = true;

gulp.task('styles', () => {
  return gulp.src('src/styles/*.css')
    .pipe($.autoprefixer({browsers: ['> 1%', 'last 2 versions', 'Firefox ESR']}))
    .pipe($.cssnano({safe: true, autoprefixer: false}))
    .pipe(gulp.dest('dist/styles'))
});

gulp.task('html', () => {
  return gulp.src('src/*.html')
    .pipe(gulp.dest('dist'));
});

gulp.task('images', () => {
  return gulp.src('src/images/**/*')
    .pipe(gulp.dest('dist/images'));
});


gulp.task('markdown', () => {
  return gulp.src("src/content/*")
    .pipe(gulp.dest('dist/content'));
});


gulp.task('extras', () => {
  return gulp.src([
    'src/*',
    '!src/index.html',
    '!src/index.js',
  ], {
    dot: true
  }).pipe(gulp.dest('dist'));
});


gulp.task('deploy', () => {
  return gulp.src('./dist/**/*')
    .pipe($.ghPages());
});

gulp.task('clean', del.bind(null, ['dist']));


gulp.task('build', ['html', 'styles','images', 'markdown', 'extras'], () => {
  return gulp.src('dist/**/*').pipe($.size({title: 'build', gzip: true}));
});

gulp.task('watch', ['build'], () => {
  gulp.watch('src/styles/**/*.css', ['styles']);
  gulp.watch('src/images/**/*', ['images']);
  gulp.watch('src/content/*.md', ['markdown']);
  gulp.watch('src/index.html', ['html']);
});


gulp.task('default', () => {
  return new Promise(resolve => {
    dev = false;
    runSequence('build', resolve);
  });
});