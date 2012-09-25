module Abbrev;
multi sub abbrev (*@words) is export {
    my $seen = KeySet.new;
    my %result;
    for @words {
        loop (my $len = .chars; $len > 0; --$len) {
            my $abbrev = .substr(0, $len);
            if $seen{$abbrev} {
                %result.delete: $abbrev;
            }
            else {
                $seen{$abbrev} = 1;
                %result{$abbrev} = $_;
            }
        }
    }
    for @words {
        %result{$_} = $_;
    }
    return %result;
}
