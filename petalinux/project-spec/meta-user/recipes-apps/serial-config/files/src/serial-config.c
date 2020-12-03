
#include <stdint.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <fcntl.h>
#include <string.h>
#include <assert.h>
#include <err.h>
#include <errno.h>
#include <sysexits.h>

#include <sys/ioctl.h>
#include <linux/types.h>
#include <linux/spi/spidev.h>

#include "spi.h"
#include "xbf.h"

#define SPI_DEV_NAME "/dev/spidev1.0"

/* For demonstration purposes only,
   DO NOT use in production environment. */
int main(int argc, char const *argv[])
{
    struct xbf xbf;
    uint8_t mode = 0;
    int seg_size = 4096;
    int ret = 0;
    int fd, i, len;
    const uint8_t *bitstream;

    if(argc < 2){
        return 1;
    }

    xbf_init(&xbf);
    if (xbf_open(&xbf, argv[1]) != 0)
        errx(EXIT_FAILURE, "%s:", xbf_errmsg(&xbf));
    xbf_print(&xbf);
    len = xbf_get_len(&xbf);
    bitstream = xbf_get_data(&xbf);
    for(i=0; i<len; i+=seg_size){
        add_transfer(&bitstream[i], i+seg_size<=len ? seg_size : len-i);
    }
    // {
    //     FILE* dfile = fopen(xbf_get_partname(&xbf), "wb");
    //     fwrite(bitstream, 1, len, dfile);
    //     fclose(dfile);
    // }

    fd = open(SPI_DEV_NAME, O_RDWR);
    if (fd < 0){
        perror("can't open device");
        exit(1);
    }
    /*
     * spi mode
     */
    ret = ioctl(fd, SPI_IOC_WR_MODE, &mode);
    if (ret == -1){
        perror("can't set spi mode");
        exit(1);
    }

    transfer(fd);

    free_all_transfers();
    close(fd);
    xbf_close(&xbf);

    return ret;
}