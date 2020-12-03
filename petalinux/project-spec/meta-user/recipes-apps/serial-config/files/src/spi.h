#ifndef SPI__H__
#define SPI__H__ 

void add_transfer(char * data, int len);
int transfer(int fd);
void free_all_transfers(void);


#endif