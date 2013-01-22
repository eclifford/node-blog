module.exports = function( grunt ) {

  grunt.registerTask('dev', 'clean:temp copy:temp stylus coffee watch');
  grunt.registerTask('build', 'clean:temp copy:temp stylus jade coffee requirejs')

  grunt.loadNpmTasks('grunt-contrib');

  //
  // Grunt configuration:
  //
  // https://github.com/cowboy/grunt/blob/master/docs/getting_started.md
  //
  grunt.initConfig({
    // //
    // // grunt-jade
    // // https://github.com/phated/grunt-jade
    // //  
    // jade: {
    //   html: {
    //     src: ['apps/**/*.jade'],
    //     dest: '.temp/web/public/tpl',
    //     options: {
    //       client: false
    //     }
    //   }
    // },
    //
    // grunt-contrib-stylus
    // https://github.com/gruntjs/grunt-contrib-stylus/
    //
    stylus: {
      dev: {
        options: {
          'include css': true,
          compress: true
        },
        files: {
          '.temp/web/public/css/app.css': 'apps/web/public/css/app.styl' // compile individually into dest, maintaining folder structure
        }
      }
    },
    //
    // grunt-watch
    //
    watch: {
      coffee: {
        files: 'apps/**/*.coffee',
        tasks: 'coffee:app'
      },     
      stlyus: {
        files: 'apps/**/*.styl',
        tasks: 'stylus'
      },
      // jade: {
      //   files: 'apps/**/*.jade',
      //   tasks: 'jade'
      // },
      other: {
        files: ['apps/**/*.css', 'apps/**/*.jpg', 'apps/**/*.html', 'apps/**/*.jade'],
        tasks: 'copy:temp'
      },
      tests: {
        files: [
          'test/specs/**/*.spec.coffee'
        ],
        tasks: 'coffee:tests'
      }
    },  
    //
    // grunt-contrib-coffee
    // https://github.com/gruntjs/grunt-contrib-coffee/
    //
    coffee: {
      app: {
        files: {
          '.temp/*.js': 'apps/**/*.coffee'
        },
        options: {
          basePath: 'apps/'
        }
      },
      tests: {
        files: {
          '.temp/specs/*.js': 'test/specs/**/*.coffee'
        },
        options: {
          basePath: 'test/specs'
        }
      }
    },
    //
    // grunt-contrib-requirejs
    // https://github.com/gruntjs/grunt-contrib-requirejs
    //
    requirejs: {
      js: {
        options: {
          optimize: "uglify",
          baseUrl: "./.temp/web/public",
          name: 'js/main',
          out: '.temp/web/public/js/main.js',
          mainConfigFile: '.temp/web/public/js/config.js'
        }
      }
    },
    //
    // grunt-contrib-copy
    // https://github.com/gruntjs/grunt-contrib-copy
    //
    copy: {
      temp: {
        options: {
          basePath: 'apps'
        },
        files: {
          ".temp/": "apps/**/*.!(coffee|styl)"
        }
      }
    },
    //
    // grunt-contrib-clean
    // https://github.com/gruntjs/grunt-contrib-clean
    //
    clean: {
      temp: ['.temp/']
    }
  });
};