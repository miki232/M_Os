TARGET = simple_os
TOOLCHAIN = xtensa-esp32-elf

CFILES = $(wildcard src/*.c)
AFILES = $(wildcard src/*.S)

OBJS = $(CFILES:.c=.o) $(AFILES:.S=.o)

CFLAGS = -Iinclude -ffreestanding -nostdlib -nostartfiles
LDFLAGS = -T esp32.ld

$(TARGET): $(OBJS)
    $(TOOLCHAIN)-gcc $(CFLAGS) $(OBJS) -o $(TARGET) $(LDFLAGS)

%.o: %.c
    $(TOOLCHAIN)-gcc $(CFLAGS) -c $< -o $@

%.o: %.S
    $(TOOLCHAIN)-gcc $(CFLAGS) -c $< -o $@

clean:
    rm -f $(OBJS) $(TARGET)
