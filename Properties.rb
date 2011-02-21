ABSOLUTE_PATH = File.expand_path(File.dirname(__FILE__))

COMPILE_TARGET = 'release'
PRODUCT = "console_app"
COPYRIGHT = "Copyright (c) 2008, 2009 2010, 2011, Armmer, LLC.  All Rights Reserved";
COMPANY = "Armmer, LLC"
DESCRIPTION = "Git training/presentation application"
COMMON_ASSEMBLY_INFO = File.join(ABSOLUTE_PATH,'console_app','Properties','AssemblyInfo.cs')
CLR_VERSION = 'v3.5'
SLN_FILE = File.join(ABSOLUTE_PATH,'console_app.sln')
ZIP_FILE_PREFIX = ["console_app-DOTNET",CLR_VERSION].join
CORE_DLL_DIR = File.join(ABSOLUTE_PATH,'console_app','bin',COMPILE_TARGET)
UNIT_TESTS_DLL = File.join(ABSOLUTE_PATH,'console_app.tests','bin',COMPILE_TARGET,'console_app.tests.dll')
RELEASE_BUILD_NUMBER = "1.0.0.0"
BUILDS_DIR = File.join(ABSOLUTE_PATH,'builds')

NUNIT_CMD_EXE = File.join(ABSOLUTE_PATH,'lib','nunit','nunit-console.exe')
FRAMEWORK_DIR = File.join(ENV['windir'].dup, 'Microsoft.NET', 'Framework', CLR_VERSION)
MSBUILD_EXE = File.join(FRAMEWORK_DIR, 'msbuild.exe')