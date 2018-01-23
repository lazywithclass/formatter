## formatter

A tool that takes two input strings, formats the second as the first.

If the length of the second is greater then all excess characters are printed one after the other once the
threshold is crossed.

### Configure

Install your [Racket](https://download.racket-lang.org/) package.

### Run

```bash
$ racket cli.rkt
```

The program will wait for input:

 * the first one is the string you want to use as formatting example, leave
 an empty line to tell you're ready to enter the second
 * the second one is the string you want to format, using the first as example,
 leave an empty line to tell you're done

For example

```bash
$ racket cli.rkt
1
 2
  3

456
```

which should output

```bash
4
 5
  6
```

Have a look [at this](https://asciinema.org/a/KgSo5Bh8De67Xg0qVoNTFS0XT) for a live example.
