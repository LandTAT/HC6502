#include "zqueue.h"

void zq_init(zqueue* q)
{
	q->head = 0;
	q->rear = 0;
}

void zq_enqueue(zqueue* q, item x)
{
	q->data[q->rear++] = x;
}

item zq_dequeue(zqueue* q)
{
	return q->data[q->head++];
}

bool zq_empty(const zqueue* q)
{
	return q->head == q->rear;
}

bool zq_full(const zqueue* q)
{
	return q->head == q->rear + 1;
}

uint8_t zq_size(const zqueue* q)
{
	return q->rear - q->head;
}
