use ExtUtils::MakeMaker;
use Config;

$perlpath=$Config{'perlpath'};

$Version = '1.0';
                           
WriteMakefile(
    'NAME'     => 'WebMirror',
    'EXE_FILES' => ['webmirror'],
    'clean' => {FILES => "*% *.bak Make/*%"},
    'linkext' => { LINKTYPE => ''},
    'dist'     => { COMPRESS => 'gzip -f', SUFFIX => 'gz' },
    'VERSION'  => $Version
);

open FILE,"webmirror" || die;
@temp = <FILE>;
close FILE;
shift @temp;
open FILE,">webmirror" || die;
print FILE "#! $perlpath\n";
print FILE @temp;
close FILE;
chmod 0755,"webmirror";
