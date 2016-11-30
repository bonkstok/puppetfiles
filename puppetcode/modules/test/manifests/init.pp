class test
(
$test_param = ['hiera','of nieti'])
{
#notify{$test_param:}

notify{'Dir created':}
notify{'File created':}
file{'/tmp/puttest': ensure => directory}
file{'/tmp/puttest/hoi.txt': ensure => file, content => 'bla bla',}
file{'/tmp/testdir': ensure => directory,}
service{'nginx':}
File{'/tmp/testing.txt': ensure => present, noop => true, tag => 'testing',}
#File{'/tmp/puttest': ensure => absent,}

#File['/tmp/puttest'] -> Notify['Dir created'] ->  File['/tmp/puttest/hoi.txt']  -> Notify['File created'] ~> Service['nginx']
#----------------------------------------------------------------------------------------------------------------------------#
#File <| noop == true |> ->  File <| ensure == directory |> -> Notify <|  |> -> File <| ensure == file |> # -> File <| ensure == directory |> { ensure => absent,}
#above makes sure that all the Files with the noop attribute property set to true, after that it will create all the directories, display all the notifies and last it will create all the files.
#----------------------------------------------------------------------------------------------------------------------------#
#File <| noop == true |> ->  File <| ensure == directory |> { ensure => absent,} -> Notify <|  |> -> File <| ensure == file |>
#same as above only that the value of the attribute is changed to absent causing the rail to fail, as the file cant be placed in a non-created directory.
#----------------------------------------------------------------------------------------------------------------------------#



}
