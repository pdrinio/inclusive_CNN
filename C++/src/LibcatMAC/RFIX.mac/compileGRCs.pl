#! /usr/bin/perl -w

use FindBin ;
use File::Spec::Functions;
use File::Copy;
use Cwd;

#-----------------------------------------------------------------------
# Executes one GRC conversion command
#-----------------------------------------------------------------------
sub DoGRC ($$$$$)
{
	my ($tool, $sourceDir, $inputFile, $destinationDir, $outputFile) = @_ ;

	system ("mkdir -p \"" . $destinationDir . "\"") ;
#	print $tool . " -m r -u 1 -q utf8 0 -T M -i \"" . catfile ($sourceDir, $inputFile) . "\" -j .roo -p \"" . catfile ($sourceDir, "Images") . "\" -o \"" . catfile ($destinationDir, $outputFile) . "\"\n" ;
	print "\t$inputFile\n";
	system ($tool . " -m r -u 1 -q utf8 0 -T M -i \"" . catfile ($sourceDir, $inputFile) . "\" -j .roo -p \"" . catfile ($sourceDir, "Images") . "\" -o \"" . catfile ($destinationDir, $outputFile) . "\"");
}


#-----------------------------------------------------------------------
# Convert GRC
#-----------------------------------------------------------------------
print "Converting resource files:\n";

my $devKitPath = catfile ($FindBin::Bin, updir (), updir (), updir ());
my $makeResConvTool = "\"" . catfile (Cwd::realpath ($devKitPath), "Support", "Tools", "OSX", "ResConv") . "\"";

my $examplePath = Cwd::realpath (catfile ($FindBin::Bin, updir ()));
my $resTarget = catfile ($ENV{TARGET_BUILD_DIR}, $ENV{UNLOCALIZED_RESOURCES_FOLDER_PATH});
my $roFolder = catfile ($examplePath, "RO");

DoGRC ( $makeResConvTool, catfile ($examplePath, "RFIX"), "DG_TestFix.grc", $roFolder, "DG_TestFix.grc.ro" ) ;
DoGRC ( $makeResConvTool, catfile ($examplePath, "RINT"), "DG_Test.grc", $roFolder, "DG_Test.grc.ro" ) ;

opendir (DIR, $roFolder);
@files = readdir (DIR);
closedir (DIR);

foreach $file (@files) {
    copy (catfile ($roFolder, $file), $resTarget) if ($file =~ /.*\.tif$/);
}

print "done.\n";
