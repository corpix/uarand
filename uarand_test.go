package uarand

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetRandom(t *testing.T) {
	for k := 0; k < len(UserAgents)*10; k++ {
		assert.NotEqual(t, "", GetRandom())
	}
}

func TestGetRandomConcurrent(t *testing.T) {
	var (
		n = 0
		ch = make(chan string)
	)


	for k := 0; k < len(UserAgents)*10; k++ {
		go func() { ch <- GetRandom() }()
		n++
	}

	for n > 0 {
		assert.NotEqual(t, "", <-ch)
		n--
	}
}
