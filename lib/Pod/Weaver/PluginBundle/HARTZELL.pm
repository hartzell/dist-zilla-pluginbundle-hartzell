use strict;
use warnings;

package Pod::Weaver::PluginBundle::HARTZELL;

# ABSTRACT: HARTZELL's default Pod::Weaver config

=head1 DESCRIPTION

This is a L<Pod::Weaver> PluginBundle.  It is roughly equivalent to
L<Pod::Weaver::PluginBundle::Default> with the addition of

=over 4

=item *

support for collecting "=requires" descriptions into a section titled
"REQUIRES" and

=item *

inclusion of the Transformer plugin.

=back

It is based on Dave Golden's L<Pod::Weaver::PluginBundle::DAGOLDEN>.

=cut

use Pod::Weaver::Config::Assembler;
use Pod::Elemental::Transformer::List 0.101620 ();

#use Pod::Weaver::Section::Support 1.001 ();

sub _exp { Pod::Weaver::Config::Assembler->expand_package( $_[0] ) }

# my $repo_intro = <<'END';
# This is open source software.  The code repository is available for
# public review and contribution under the terms of the license.
# END
#
# my $bugtracker_content = <<'END';
# Please report any bugs or feature requests through the issue tracker
# at {WEB}.
# You will be notified automatically of any progress on your issue.
# END

sub mvp_bundle_config {
    my @plugins;
    push @plugins, (
        [ '@HARTZELL/CorePrep', _exp('@CorePrep'), {} ],
        [ '@HARTZELL/Name',     _exp('Name'),      {} ],
        [ '@HARTZELL/Version',  _exp('Version'),   {} ],

        [ '@HARTZELL/Prelude', _exp('Region'), { region_name => 'prelude' } ],
        [ '@HARTZELL/Synopsis', _exp('Generic'), { header => 'SYNOPSIS' } ],
        [   '@HARTZELL/Description', _exp('Generic'),
            { header => 'DESCRIPTION' }
        ],
        [ '@HARTZELL/Overview', _exp('Generic'), { header => 'OVERVIEW' } ],
    );

    for my $plugin (
        [ 'Attributes',     _exp('Collect'), { command => 'attr' } ],
        [ 'Methods',        _exp('Collect'), { command => 'method' } ],
        [ 'Functions',      _exp('Collect'), { command => 'func' } ],
        [ 'Requires',       _exp('Collect'), { command => 'requires' } ],
        [ 'Roles Consumed', _exp('Collect'), { command => 'with' } ],
        )
    {
        $plugin->[2]{header} = uc $plugin->[0];
        push @plugins, $plugin;
    }

    push @plugins, (
        [ '@HARTZELL/Leftovers', _exp('Leftovers'), {} ],
        [   '@HARTZELL/postlude', _exp('Region'),
            { region_name => 'postlude' }
        ],

        #    [ '@HARTZELL/Support',   _exp('Support'),
        #      {
        #        perldoc => 0,
        #        websites => 'none',
        #        bugs => 'metadata',
        #        bugs_content => $bugtracker_content,
        #        repository_link => 'both',
        #        repository_content => $repo_intro
        #      }
        #    ],
        [ '@HARTZELL/Authors', _exp('Authors'), {} ],
        [ '@HARTZELL/Legal',   _exp('Legal'),   {} ],
        [   '@HARTZELL/List', _exp('-Transformer'),
            { 'transformer' => 'List' }
        ],
    );

    return @plugins;
}

1;

=for Pod::Coverage mvp_bundle_config

=head1 USAGE

This PluginBundle is used by default in the
L<Dist::Zilla::PluginBundle::HARTZELL> L<Dist::Zilla> plugin bundle.

=head1 SEE ALSO

=over

=item *

L<Pod::Weaver>

=item *

L<Pod::Elemental::Transformer::List>

=item *

L<Dist::Zilla::Plugin::PodWeaver>

L<Dist::Zilla::PluginBundle::DAGOLDEN>

=back

=cut
