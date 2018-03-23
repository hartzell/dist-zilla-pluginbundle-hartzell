requires "Dist::Zilla" => "4.3";
requires "Dist::Zilla::Plugin::AutoMetaResources" => "0";
requires "Dist::Zilla::Plugin::AutoPrereqs" => "0";
requires "Dist::Zilla::Plugin::CheckChangesHasContent" => "0";
requires "Dist::Zilla::Plugin::CheckExtraTests" => "0";
requires "Dist::Zilla::Plugin::CheckMetaResources" => "0.001";
requires "Dist::Zilla::Plugin::CheckPrereqsIndexed" => "0.002";
requires "Dist::Zilla::Plugin::ConfirmRelease" => "0";
requires "Dist::Zilla::Plugin::CopyFilesFromBuild" => "0";
requires "Dist::Zilla::Plugin::ExecDir" => "0";
requires "Dist::Zilla::Plugin::FakeRelease" => "0";
requires "Dist::Zilla::Plugin::Git::Check" => "0";
requires "Dist::Zilla::Plugin::Git::Commit" => "0";
requires "Dist::Zilla::Plugin::Git::GatherDir" => "0";
requires "Dist::Zilla::Plugin::Git::NextVersion" => "0";
requires "Dist::Zilla::Plugin::Git::Push" => "0";
requires "Dist::Zilla::Plugin::Git::Tag" => "0";
requires "Dist::Zilla::Plugin::License" => "0";
requires "Dist::Zilla::Plugin::Manifest" => "0";
requires "Dist::Zilla::Plugin::ManifestSkip" => "0";
requires "Dist::Zilla::Plugin::MetaJSON" => "0";
requires "Dist::Zilla::Plugin::MetaNoIndex" => "0";
requires "Dist::Zilla::Plugin::MetaProvides::Package" => "1.14";
requires "Dist::Zilla::Plugin::MetaTests" => "0";
requires "Dist::Zilla::Plugin::MetaYAML" => "0";
requires "Dist::Zilla::Plugin::MinimumPerl" => "0";
requires "Dist::Zilla::Plugin::ModuleBuild" => "0";
requires "Dist::Zilla::Plugin::NextRelease" => "0";
requires "Dist::Zilla::Plugin::PkgVersion" => "0";
requires "Dist::Zilla::Plugin::PodCoverageTests" => "0";
requires "Dist::Zilla::Plugin::PodSyntaxTests" => "0";
requires "Dist::Zilla::Plugin::PodWeaver" => "0";
requires "Dist::Zilla::Plugin::PruneCruft" => "0";
requires "Dist::Zilla::Plugin::ReadmeAnyFromPod" => "0.120051";
requires "Dist::Zilla::Plugin::ReadmeFromPod" => "0";
requires "Dist::Zilla::Plugin::ShareDir" => "0";
requires "Dist::Zilla::Plugin::TaskWeaver" => "0.101620";
requires "Dist::Zilla::Plugin::Test::Compile" => "0";
requires "Dist::Zilla::Plugin::Test::Perl::Critic" => "0";
requires "Dist::Zilla::Plugin::Test::PodSpelling" => "2.001002";
requires "Dist::Zilla::Plugin::Test::Portability" => "0";
requires "Dist::Zilla::Plugin::Test::Version" => "0";
requires "Dist::Zilla::Plugin::TestRelease" => "0";
requires "Dist::Zilla::PluginBundle::Filter" => "0";
requires "Dist::Zilla::PluginBundle::Git" => "1.121010";
requires "Dist::Zilla::Role::PluginBundle::Config::Slicer" => "0";
requires "Dist::Zilla::Role::PluginBundle::Easy" => "0";
requires "Moose" => "0.99";
requires "Pod::Elemental::Transformer::List" => "0.101620";
requires "Pod::Weaver::Config::Assembler" => "0";
requires "autodie" => "2.00";
requires "namespace::autoclean" => "0.09";
requires "perl" => "5.006";
requires "strict" => "0";
requires "warnings" => "0";

on 'build' => sub {
  requires "Module::Build" => "0.28";
};

on 'test' => sub {
  requires "File::Spec" => "0";
  requires "File::Temp" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Test::More" => "0";
  requires "perl" => "5.006";
};

on 'test' => sub {
  recommends "Pod::Coverage::TrustPod" => "0";
  recommends "Test::CPAN::Meta" => "0";
  recommends "Test::Perl::Critic" => "0";
  recommends "Test::Pod::Coverage" => "0";
};

on 'configure' => sub {
  requires "Module::Build" => "0.28";
  requires "perl" => "5.006";
};

on 'develop' => sub {
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Pod::Wordlist" => "0";
  requires "Test::CPAN::Meta" => "0";
  requires "Test::More" => "0";
  requires "Test::Perl::Critic" => "0";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
  requires "Test::Portability::Files" => "0";
  requires "Test::Spelling" => "0.12";
  requires "Test::Version" => "1";
};
