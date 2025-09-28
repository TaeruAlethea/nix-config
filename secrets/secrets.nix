let
  astraeaf = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHtAgCs2jz5xqn0YVPoUMCJFqkIJ0eQP+3aoJVDMUTDk";
in
{
  "secret1.age".publicKeys = [ astraeaf ];
}
