# How to use the default commands to overwrite MacOS menu shortcuts

### Read shortcuts that were previously set

```bash
defaults read com.google.chrome NSUserKeyEquivalents
```

### Write shortcuts into settings

```bash
defaults write com.google.chrome NSUserKeyEquivalents "{ Forward = '^\\U2190'; }"
```

Take into account that the content passed in the write needs to be single quoted and one line

### Find all changed shortcuts

```bash
defaults find NSUserKeyEquivalents
```

---

Source: https://apple.stackexchange.com/a/445233

