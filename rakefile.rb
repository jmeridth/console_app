require 'rubygems'
require 'albacore'
require "Properties.rb"
require "fileutils"

desc "compiles, runs tests and creates zip file"
task :all => [:default]

desc "compiles, runs tests and creates zip file"
task :default => [:compile, :tests, :zip]

################
#  COMPILE THE CODE
################

desc "Update the version information for the build"
assemblyinfo :assemblyinfo do |asm|
  puts "The build number is #{RELEASE_BUILD_NUMBER}"
  asm.version = RELEASE_BUILD_NUMBER
  asm.company_name = COMPANY
  asm.product_name = PRODUCT
  asm.description = DESCRIPTION
  asm.copyright = COPYRIGHT
  asm.output_file = COMMON_ASSEMBLY_INFO
end

desc "Compiles the app"
msbuild :compile => :assemblyinfo do |msb|
  msb.command = MSBUILD_EXE
  msb.properties :configuration => COMPILE_TARGET
  msb.targets :Rebuild
  msb.verbosity = "minimal"
  msb.solution = SLN_FILE
end

################
#  RUN TESTS
################
desc "Run unit tests"
task :tests => [:unit_tests]

desc "Run unit tests"
nunit :unit_tests do |nunit|
  nunit.command = NUNIT_CMD_EXE
  nunit.assemblies UNIT_TESTS_DLL
  nunit.options '/xml=console_app-unit-tests-results.xml'
end

########################
#  CREATING ZIP FILES
########################

desc "Create a binary zip"
zip do |zip|
  puts "CREATING ZIP"
  Dir.mkdir BUILDS_DIR if !File.directory?(BUILDS_DIR)  
  file = "#{ZIP_FILE_PREFIX}-bin-#{RELEASE_BUILD_NUMBER}.zip"
  File.delete(file) if File.exists?(file)

  zip.output_path = BUILDS_DIR
  zip.directories_to_zip CORE_DLL_DIR
  zip.output_file = file

  puts "ZIP CREATION COMPLETE"
end