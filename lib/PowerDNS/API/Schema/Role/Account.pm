package PowerDNS::API::Schema::Role::Account;
use Moose::Role;
use Crypt::SaltedHash;

use namespace::clean;

sub check_password {
    my ($self, $password) = @_;
    return 0 unless $self->password and $password;
    return 1 if Crypt::SaltedHash->validate($self->password, $password);
    return 0;
}

sub has_access {
    my ($self, $domain) = @_;

    # return 1 if $self->is_admin;

    return 1 if ($domain->account and $domain->account->id eq $self->id );
    return 0;
}

1;
