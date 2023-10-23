#include <X11/Xlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>

int main() {
  Display* display = XOpenDisplay(NULL);
  if (!display) {
    exit(1);
  }
  
  int screen = DefaultScreen(display);
  Window window = XCreateSimpleWindow(display, RootWindow(display,screen), 10, 10, 100, 100, 1, 
                               BlackPixel(display,screen), BlackPixel(display,screen));
  XSelectInput(display, window, ExposureMask | KeyPressMask);
  XMapWindow(display, window);

  XEvent event;
  while (true) {
     XNextEvent(display, &event);
     if (event.type == KeyPress) {
        uint32_t event_code=event.xkey.keycode;
        if (event_code == 73) {
          break;
        }
     }
  }

  XCloseDisplay(display);
  return 0;
}

